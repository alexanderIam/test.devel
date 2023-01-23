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

 use Tygh\Registry;
 
if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($mode === 'departments') {
    Tygh::$app['session']['continue_url'] = 'departments.departments';

    $params = $_REQUEST;
    $params['usergroup_ids'] = Tygh::$app['session']['auth']['usergroup_ids'];

    list($departments, $search) = fn_get_departments($params, Registry::get('addons.departments.departments_per_page'), CART_LANGUAGE);

    Tygh::$app['view']->assign([
        'departments' => $departments,
        'search' => $search,
        'columns' => 3,
    ]);

    fn_add_breadcrumb(__('departments_title'));

} elseif ($mode === 'department') {
    Tygh::$app['session']['continue_url'] = 'departments.departments';

    $department_data = [];
    $department_id = !empty($_REQUEST['department_id']) ? $_REQUEST['department_id'] : 0;
    $department_data = fn_get_department_data($department_id, DESCR_SL);
    
    fn_add_breadcrumb(__('departments_title'), Tygh::$app['session']['continue_url']);
 
    Tygh::$app['view']->assign('department_data', $department_data);
}
