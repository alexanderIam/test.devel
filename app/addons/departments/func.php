<?php
/***************************************************************************
 *                                                                          *
 *   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
 *                                                                          *
 * This  is  commercial  software,  only  users  who have purchased a valid *
 * license  and  accept  to the terms of the  License Agreement can install *
 * and use this program.                                                    *
 *                                                                          *
 ****************************************************************************
 * PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
 * "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
 ****************************************************************************/

use Tygh\Languages\Languages;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

/**
*Get department data
*
*@param array   $params         Request parameters
*@param string  $lang_code      Two-letter language code (e.g. 'en', 'ru', etc.)
*
*@return array  Array with departments data
*/
function fn_get_department_data($department_id = 0, $lang_code = CART_LANGUAGE)
{
    $department = [];

    if (!empty($department_id)) {
        list($departments) = fn_get_departments([
            'department_id' => $department_id,
            'user_id' => Tygh::$app['session']['auth']['user_id']
        ], 1, $lang_code);

        if (!empty($departments)) {
            $department = reset($departments);
            $department['user_ids'] = fn_department_get_links($department['department_id']);
        }

        if (!empty($department['user_ids'])) {
            $user_ids = implode(',', $department['user_ids']);
            $department['user_info'] = db_get_array("SELECT user_id, lastname, firstname, email, phone
                                                    FROM ?:users WHERE user_id IN ($user_ids)");
        }
    }

    return $department;
}

/**
*Get departments data
*
*@param array   $params         Request parameters
*@param integer $items_per_page Amount of departments per page
*@param string  $lang_code      Two-letter language code (e.g. 'en', 'ru', etc.)
*
*@return array  Array with departments data
*/
function fn_get_departments($params = [], $items_per_page = 0, $lang_code = CART_LANGUAGE)
{
    $default_params = [
        'page' => 1,
        'items_per_page' => $items_per_page
    ];
    $params = array_merge($default_params, $params);

    if (AREA === 'C') {
        $params['status'] = 'A';
    }

    $sortings = [
        'timestamp' => '?:departments.timestamp',
        'name' => '?:department_descriptions.department',
        'status' => '?:departments.status',
    ];

    $condition = $limit = $join = '';

    if (!empty($params['limit'])) {
        $limit = db_quote(' LIMIT 0, ?i', $params['limit']);
    }

    $sorting = db_sort($params, $sortings, 'name', 'asc');

    if (!empty($params['item_ids'])) {
        $condition .= db_quote(' AND ?:departments.department_id IN (?n)', explode(',', $params['item_ids']));
    }

    if (!empty($params['department_id'])) {
        $condition .= db_quote(' AND ?:departments.department_id = ?i', $params['department_id']);
    }

    if (!empty($params['status'])) {
        $condition .= db_quote(' AND ?:departments.status = ?s', $params['status']);
    }

    if (Tygh::$app['session']['auth']['user_type'] != 'A') {
        if (!empty($params['user_id']) || $params['user_id'] === 0) {
            $condition .= db_quote(' AND ?:department_links.user_ids= ?i', $params['user_id']);
            $join .= db_quote(' LEFT JOIN ?:department_links ON 
            ?:department_links.department_id = ?:departments.department_id');
        }
    }

    if (isset($params['cname']) && fn_string_not_empty($params['cname'])) {
        $arr = fn_explode(' ', trim($params['cname']));
        $arr = array_values(array_filter($arr, 'fn_string_not_empty'));
        $like_expression = ' AND (';
        $search_string = '%' . trim($params['cname']) . '%';

        if (sizeof($arr) === 2) {
            $like_expression .= db_quote('(?:department_descriptions.department LIKE ?l', '%' . $arr[0] . '%');
            $like_expression .= db_quote(' AND ?:department_descriptions.department LIKE ?l)', '%' . $arr[1] . '%');
        } else {
            $like_expression .= db_quote('?:department_descriptions.department LIKE ?l', $search_string);
        }
        $like_expression .= ')';
        $condition .= $like_expression;
    }

    $fields = [
        '?:departments.*',
        '?:department_descriptions.department',
        '?:department_descriptions.description',
        '?:users.firstname',
        '?:users.lastname',
    ];

    $join .= db_quote(' LEFT JOIN ?:department_descriptions ON 
?:department_descriptions.department_id = ?:departments.department_id 
AND ?:department_descriptions.lang_code = ?s', $lang_code);
    $join .= db_quote(' LEFT JOIN ?:users ON ?:users.user_id = ?:departments.admin_id');

    /*pagination*/
    if (!empty($params['items_per_page'])) {
        $params['total_items'] = db_get_field("SELECT COUNT(*) FROM ?:departments $join WHERE 1 $condition");
        $limit = db_paginate($params['page'], $params['items_per_page'], $params['total_items']);
    }

    $departments = db_get_hash_array(
        "SELECT ?p FROM ?:departments" .
            $join .
            " WHERE 1 ?p ?p ?p",
        'department_id',
        implode(', ', $fields),
        $condition,
        $sorting,
        $limit,
    );

    $department_image_ids = array_keys($departments);
    $images = fn_get_image_pairs($department_image_ids, 'department', 'M', true, false, $lang_code);

    foreach ($departments as $department_id => $department) {
        $departments[$department_id]['main_pair'] = !empty($images[$department_id]) ? reset($images[$department_id]) : [];
    }

    return [$departments, $params];
}

/**
*Update department data
*
*@param array    $department_data Request parameters
*@param integer  $department_id   Departmemt id
*@param string   $lang_code       Two-letter language code (e.g. 'en', 'ru', etc.)
*
*@return integer $department_id   Departmemt id
*/
function fn_update_department($department_data, $department_id, $lang_code = DESCR_SL)
{
    if (isset($department_data['timestamp'])) {
        $department_data['timestamp'] = fn_parse_date($department_data['timestamp']);
    }

    if (!empty($department_id)) {
        db_query("UPDATE ?:departments SET ?u WHERE department_id = ?i", $department_data, $department_id);
        db_query("UPDATE ?:department_descriptions SET ?u WHERE department_id = ?i AND lang_code = ?s", $department_data, $department_id, $lang_code);
    } else {
        $department_id = $department_data['department_id'] = db_replace_into('departments', $department_data);

        foreach (Languages::getAll() as $department_data['lang_code'] => $v) {
            db_query("REPLACE INTO ?:department_descriptions ?e", $department_data);
        }
    }

    if (!empty($department_id)) {
        fn_attach_image_pairs('department', 'department', $department_id, $lang_code);
    }

    fn_department_delete_links($department_id);
    fn_department_add_links($department_id,  $department_data['users_ids']);

    return $department_id;
}

/**
*Delete department
*
*@param integer  $department_id   Departmemt id
*/
function fn_delete_department($department_id)
{
    if (!empty($department_id)) {
        db_query('DELETE FROM ?:departments WHERE department_id = ?i', $department_id);
        db_query('DELETE FROM ?:department_descriptions WHERE department_id = ?i', $department_id);
        fn_department_delete_links($department_id);
    }
}

/**
*Delete department links
*
*@param integer  $department_id   Departmemt id
*/
function  fn_department_delete_links($department_id)
{
    db_query('DELETE FROM ?:department_links WHERE department_id = ?i', $department_id);
}

/**
*Add department links
*
*@param integer  $department_id   Departmemt id
*@param string   $department_data Numbers of users ids
*/
function fn_department_add_links($department_id, $department_data)
{
    if (!empty($department_data)) {
        $user_ids = explode(',', $department_data);
        foreach ($user_ids as $user_id) {
            db_query("REPLACE INTO ?:department_links ?e", [
                'user_ids' => $user_id,
                'department_id' => $department_id,
            ]);
        }
    }
}

/**
* Get user_ids assigned
*
*@param integer $department_id
*
*@return array  Array with user_ids assigned to department
*/
function fn_department_get_links($department_id)
{
    return !empty($department_id) ? db_get_fields('SELECT user_ids FROM ?:department_links where department_id = ?i', $department_id) : [];
}
