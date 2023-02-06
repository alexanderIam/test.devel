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

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($mode === 'departments') {

    Tygh::$app['session']['continue_url'] = 'departments.departments';

    $params = $_REQUEST;
    $params['user_id'] = Tygh::$app['session']['auth']['user_id'];

    if (empty($params['user_id'])) {
        return [CONTROLLER_STATUS_DENIED];
    }

    if ($sort_by = fn_change_session_param(Tygh::$app['session'], $_REQUEST, 'sort_by')) {
        $params['sort_by'] = $sort_by;
    }

    if ($sort_order = fn_change_session_param(Tygh::$app['session'], $_REQUEST, 'sort_order')) {
        $params['sort_order'] = $sort_order;
    }

    list($departments, $search) = fn_get_departments($params, DEPARTMENTS_PER_PAGE, CART_LANGUAGE);
    
    Tygh::$app['view']->assign([
        'departments' => $departments,
        'search' => $search,
        'columns' => 3,
    ]);

    fn_add_breadcrumb(__('departments_title'), Tygh::$app['session']['continue_url']);

} elseif ($mode === 'department') {

    Tygh::$app['session']['continue_url'] = 'departments.departments';

    $department_data = [];
    $department_id = !empty($_REQUEST['department_id']) ? $_REQUEST['department_id'] : 0;
    $department_data['user_id'] = Tygh::$app['session']['auth']['user_id'];

    if (empty($department_data['user_id'])) {
        return [CONTROLLER_STATUS_NO_PAGE];
    }

    $department_data = fn_get_department_data($department_id, DESCR_SL);

    fn_add_breadcrumb(__('departments_title'), Tygh::$app['session']['continue_url']);
    $params = $_REQUEST;
    $params['extend'] = ['description'];
    $params['user_ids'] = !empty($department_data['user_ids']) ? implode(',', $department_data['user_ids']) : -1;

    if ($items_per_page = fn_change_session_param(Tygh::$app['session']['search_params'], $_REQUEST, 'items_per_page')) {
        $params['items_per_page'] = $items_per_page;
    }

    if ($sort_by = fn_change_session_param(Tygh::$app['session']['search_params'], $_REQUEST, 'sort_by')) {
        $params['sort_by'] = $sort_by;
    }

    if ($sort_order = fn_change_session_param(Tygh::$app['session']['search_params'], $_REQUEST, 'sort_order')) {
        $params['sort_order'] = $sort_order;
    }

    Tygh::$app['view']->assign('department_data', $department_data);
}
