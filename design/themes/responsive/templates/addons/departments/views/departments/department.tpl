<div id="product_features_{$block.block_id}">
    <div class="ty-grid-list__item-name">
        {$obj_id = $department_data.department}
        {$obj_id_prefix = "`$department_data.firstname` `$department_data.lastname`"}
            
            {if $department_data.admin_id>0}
                {$obj_id_prefix}
            {else}
                {__("department_not_assigned")}
            {/if}

     </div>
    <div class="ty-feature">
    
        {if $department_data.main_pair}
            <div class="ty-feature__image">
            {include "common/image.tpl" 
                images=$department_data.main_pair
                image_width=$settings.Thumbnails.product_lists_thumbnail_width 
                image_height=$settings.Thumbnails.product_lists_thumbnail_height
            }
            </div>
        {/if}

        <div class="ty-feature__description ty-wysiwyg-content">
            {$department_data.description nofilter}
        </div>
    </div>
    <h1 class="ty-mainbox-title">{__("department_workers_list")}</h>
    
    {if $department_data.user_info}
        <div class="ty-compact-list_item">
            <div class="ty-pagination-container cm-pagination-container">
                <table class="ty-table ty-vendor-communication-search" id="threads_table">
                    <thead>
                        <tr>
                            <th width="12%">
                                {__("user_id")}
                            </th>
                            <th width="40%">
                                {__("name")}
                            </th>
                            <th width="21%">
                                {__("email")}
                            </th>
                            <th width="17%">
                                {__("phone")}
                            </th>
                        </tr>
                    </thead>
                    {foreach $department_data.user_info as $user_assigned}            
                        {$user_name = "`$user_assigned.lastname` `$user_assigned.firstname`"}                
                        {$user_id = "`$user_assigned.user_id`"}
                        {$user_email = "`$user_assigned.email`"}
                        {$user_phone = "`$user_assigned.phone`"}
                            <tr>
                                <td class="ty-vendor-communication-search__item ">
                                    {$user_id nofilter}
                                </td> 
                                <td class="ty-vendor-communication-search__item ">
                                    {$user_name nofilter}              
                                </td>
                                <td class="ty-vendor-communication-search__item ">
                                    {$user_email nofilter}                
                                </td>
                                <td class="ty-vendor-communication-search__item ">
                                    {$user_phone nofilter}
                                </td>
                            </tr>
                    {/foreach}
                </table>
            </div>
        </div>  
    {else}
        <p class="ty-no-items">{__("department_no_workers")}</p>
    {/if}

</div>

{capture name="mainbox_title"}{$department_data.department nofilter}{/capture}
