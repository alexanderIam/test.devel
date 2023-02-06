{capture name="mainbox"}

    <form action="{""|fn_url}" method="post" id="departments_form" name="departments_form" enctype="multipart/form-data">
        
        <input type="hidden" name="fake" value="1"/>
        {include file="common/pagination.tpl" save_current_page=true save_current_url=true div_id="pagination_contents_departments"}
        {$c_url=$config.current_url|fn_query_remove:"sort_by":"sort_order"}
        {$rev=$smarty.request.content_id|default:"pagination_contents_departments"}
        {include_ext file="common/icon.tpl" class="icon-`$search.sort_order_rev`" assign=c_icon}
        {include_ext file="common/icon.tpl" class="icon-dummy" assign=c_dummy}
        {$image_width = $settings.Thumbnails.product_admin_mini_icon_width}
        {$image_height = $settings.Thumbnails.product_admin_mini_icon_height}
        {$department_statuses=""|fn_get_default_statuses:false}
        {$has_permission = true}

        {if $departments}
            {capture name="departments_table"}
                <div class="table-responsive-wrapper longtap-selection">
                     <table class="table table-middle table--relative table-responsive">
                        <thead
                            data-ca-bulkedit-default-object="true"
                            data-ca-bulkedit-component="defaultObject"
                        >
                            <tr>
                                <th width="6%" class="left mobile-hide">
                                    {include "common/check_items.tpl" 
                                        is_check_disabled=!$has_permission 
                                        check_statuses=($has_permission) ? $department_statuses : '' 
                                    }
                                    <input type="checkbox" class="bulkedit-toggler hide"
                                        data-ca-bulkedit-disable="[data-ca-bulkedit-default-object=true]"
                                        data-ca-bulkedit-enable="[data-ca-bulkedit-expanded-object=true]" 
                                    />
                                </th>                          
                                <th width="" class="nowrap">
                                    {__("logos")}
                                </th>
                                <th width=""><a class="cm-ajax"
                                    href="{"`$c_url`&sort_by=name&sort_order=`$search.sort_order_rev`"|fn_url}"
                                    data-ca-target-id={$rev}>{__("departments_title")}{if $search.sort_by === "department"}{$c_icon nofilter}{/if}</a>
                                </th>
                                <th width="6%" class="mobile-hide">&nbsp;
                                </th>
                                <th width="10%" class="right">
                                    <a class="cm-ajax"
                                        href="{"`$c_url`&sort_by=status&sort_order=`$search.sort_order_rev`"|fn_url}"
                                        data-ca-target-id={$rev}>{__("status")}{if $search.sort_by === "status"}{$c_icon nofilter}{/if}
                                    </a>
                                </th>
                            </tr>
                        </thead>

                        {foreach $departments as $department}
                            <tr class="cm-row-status-{$department.status|lower} cm-longtap-target"
                                {if $has_permission}
                                    data-ca-longtap-action="setCheckBox"
                                    data-ca-longtap-target="input.cm-item"
                                    data-ca-id="{$department.department_id}"
                                {/if}
                            >
                                {$allow_save=$department|fn_allow_save_object:"departments"}

                                {if $allow_save}
                                    {$no_hide_input="cm-no-hide-input"}
                                {else}
                                    {$no_hide_input=""}
                                {/if}

                                <td width="6%" class="left mobile-hide">
                                    <input type="checkbox" name="department_ids[]" value="{$department.department_id}" class="cm-item {$no_hide_input} cm-item-status-{$department.status|lower} hide" /></td>
                                <td class="products-list__image">
                                    {include "common/image.tpl"
                                        image=$department.main_pair.icon|default:$department.main_pair.detailed
                                        image_id=$department.main_pair.image_id
                                        image_width=$image_width
                                        image_height=$image_height
                                        href="departments.update_department?department_id=`$department.department_id`"|fn_url
                                        image_css_class="department-list__image--img"
                                        link_css_class="department-list__image--link"
                                    }       
                                </td>
                                <td class="{$no_hide_input}" data-th="{__("name")}">
                                    <a class="row-status"
                                        href="{"departments.update_department?department_id=`$department.department_id`"|fn_url}">{$department.department}</a>
                                </td>
                                <td width="6%" class="mobile-hide">
                                    {capture name="tools_list"}
                                        <li>
                                            {btn type="list" text=__("edit") href="departments.update_department?department_id=`$department.department_id`"}
                                        </li>
                                        {if $allow_save}
                                            <li>
                                                {btn type="list" class="cm-confirm" text=__("delete") href="departments.delete_department?department_id=`$department.department_id`" method="POST"}
                                            </li>
                                        {/if}
                                    {/capture}
                                    <div class="hidden-tools">
                                        {dropdown content=$smarty.capture.tools_list}
                                    </div>
                                </td>
                                <td width="10%" class="right" data-th="{__("status")}">
                                    {include "common/select_popup.tpl" 
                                        id=$department.department_id 
                                        status=$department.status    
                                        object_id_name="department_id" 
                                        items_status=$department_statuses
                                        table="departments"
                                        popup_additional_class="dropleft"
                                    }
                                </td>
                            </tr>
                        {/foreach}
                    </table>
                </div>
            {/capture}

            {include "common/context_menu_wrapper.tpl"
                form="departments_form"
                object="departments"
                items=$smarty.capture.departments_table
                has_permissions=true
            }

        {else}
            <p class="no-items">{__("no_data")}</p>
        {/if}

        {include "common/pagination.tpl" div_id="pagination_contents_departments"}

        {capture name="buttons"}
            {capture name="tools_list"}
                    <li>
                        {btn type="delete_selected" dispatch="dispatch[departments.delete_departments]" form="departments_form"}
                    </li>
            {/capture}
        {/capture}

        {capture name="adv_buttons"}
            {include "common/tools.tpl" 
                tool_href="departments.add_department" 
                prefix="top" 
                hide_tools="true"
                title=__("add_department") 
                icon="icon-plus"
            }
        {/capture}

    </form>
{/capture}

{capture name="sidebar"}

    {include "common/saved_search.tpl" 
        dispatch="departments.manage_department" 
        view_type="departments"
    }

    {include "addons/departments/views/departments/components/department_search_form.tpl" 
        dispatch="departments.manage_department"
    }

{/capture}

{hook name="departments:manage_mainbox_params"}
{$page_title = __("departments_title")}
{$select_languages = false}
{/hook}

{include "common/mainbox.tpl" 
    title=$page_title 
    content=$smarty.capture.mainbox 
    buttons=$smarty.capture.buttons 
    sidebar=$smarty.capture.sidebar 
    adv_buttons=$smarty.capture.adv_buttons 
    select_languages=$select_languages 
}
