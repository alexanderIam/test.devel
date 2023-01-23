{script src="js/addons/departments/func.js"}
{if $department_data}
    {$id = $department_data.department_id}
{else}
    {$id = 0}
{/if}

{capture name="mainbox"}
    <form action="{""|fn_url}" method="post" class="form-horizontal form-edit" name="departments_form" enctype="multipart/form-data">
        
        <input type="hidden" class="cm-no-hide-input" name="fake" value="1" />
        <input type="hidden" class="cm-no-hide-input" name="department_id" value="{$id}" />
        <div id="content_general">
            <div class="control-group cm-ajax" id="department_name">
                <label for="elm_department_name" class="control-label cm-required">
                    {__("name")}
                </label>
                <div class="controls">
                    <input type="text" name="department_data[department]" id="elm_department_name"
                        value="{$department_data.department}" size="25" class="input-large" />
                </div>
            <!--department_name-->
            </div>
            <div class="control-group" id="banner_graphic">
                <label class="control-label">{__("image")}</label>
                <div class="controls">
                    {include "common/attach_images.tpl"
                        image_name="department"
                        image_object_type="department"
                        image_pair=$department_data.main_pair
                        image_object_id=$id
                        no_detailed=true
                        hide_titles=true
                    }
                </div>
            </div>
            <div class="control-group" id="banner_text">
                <label class="control-label" for="elm_department_description">{__("description")}</label>
                <div class="controls">
                    <textarea id="elm_department_description" name="department_data[description]" cols="35" rows="8"
                        class="cm-wysiwyg input-large">{$department_data.description}
                    </textarea>
                </div>
            </div>
            <div class="control-group" {if $mode_check == 'add_department'}hidden{/if}>
                <label class="control-label">{__("creation_date")}</label>
                <div class="controls">
                    <input type="text" name="department_data[timestamp]"
                        value="{$o.timestamp|date_format:"`$settings.Appearance.date_format`, `$settings.Appearance.time_format`"}" size="25" class="input-medium" readonly />      
                </div>
            </div>

            {include "common/select_status.tpl" 
                input_name="department_data[status]" 
                id="elm_department_status" 
                obj_id=$id 
                obj=$department_data 
                hidden=false
            }

            <div class="control-group">
                <label class="control-label">{__("department_manager")}</label>
                <div class="controls">
                    {include "pickers/departments/picker.tpl" 
                        but_text=__("department_add_manager") 
                        data_id="return_users" 
                        but_meta="btn" 
                        input_name="department_data[admin_id]" 
                        item_ids=$department_data.admin_id
                        placement="right"
                        display="radio"
                        view_mode="single_button"
                        user_info=$u_info
                        user_type="A"
                    }           
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">{__("usergroups")}</label>
                <div class="controls">
                    {include "common/select_usergroups.tpl"
                        id="department_data_usergroup_id"
                        name="department_data[usergroup_ids]"
                        usergroup=$usergroups
                        usergroup_ids=$department_data.usergroup_ids input_extra=""
                        list_mode=true
                    }
                </div>
            </div>     
            <div class="control-group">
                <label class="control-label">{__("department_worker")}</label>
                <div class="controls">
                        {include "pickers/users/picker.tpl" 
                            but_text=__("department_add_worker") 
                            data_id="return_users" 
                            but_meta="btn" 
                            input_name="department_data[users_ids]" 
                            item_ids=$department_data.user_ids
                            placement="right"
                        }
                 </div>
            </div>
        </div>

        {capture name="buttons"}
            {if !$id}
                {include "buttons/save_cancel.tpl" 
                    but_role="submit-link" 
                    but_target_form="departments_form"
                    but_name="dispatch[departments.update_department]"
                }
            {else}
                {include 
                    file="buttons/save_cancel.tpl" 
                    but_name="dispatch[departments.update_department]" 
                    but_role="submit-link" 
                    but_target_form="departments_form" 
                    hide_first_button=$hide_first_button 
                    hide_second_button=$hide_second_button save=$id
                }

            {capture name="tools_list"}
                <li>
                    {btn type="list" text=__("delete") class="cm-confirm" href="departments.delete_department?department_id=`$id`" method="POST"}
                </li>
            {/capture}

            {dropdown content=$smarty.capture.tools_list}
            {/if}
        {/capture}
    </form>
{/capture}

{include "common/mainbox.tpl"
    title=($id) ?  __("departments.editing_department") : __("departments.new_departemnt")
    content=$smarty.capture.mainbox
    buttons=$smarty.capture.buttons
    select_languages=true
}
