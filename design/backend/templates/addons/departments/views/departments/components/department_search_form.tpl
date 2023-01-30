<div class="sidebar-row">
    <h6>{__("admin_search_title")}</h6>
    <form action="{""|fn_url}" name="shipments_search_form" method="get">
    
        {if $smarty.request.redirect_url}
            <input type="hidden" name="redirect_url" value="{$smarty.request.redirect_url}" />
        {/if}

        {if $selected_section != ""}
            <input type="hidden" id="selected_section" name="selected_section" value="{$selected_section}" />
        {/if}

        {$extra nofilter}

        {capture name="simple_search"}
            <div class="sidebar-field">
                <label for="elm_cname">{__("department_title")}</label>
                <div class="break">
                    <input type="text" name="cname" id="elm_cname" value="{$search.cname}" size="30"/>
                </div>
            </div>
            <div class="sidebar-field">
                <label for="elm_status">{__("status")}:</label>
                <select name="status" id="status">
                    <option value="">--</option>        
                    {foreach from=$department_statuses key="status" item="name"}
                        <option value="{$status}" {if $search.status == $status}selected="selected"{/if}>{$name}</option>
                    {/foreach}
                </select>
            </div>
        {/capture}

        {include "common/advanced_search.tpl" 
            advanced_search=$smarty.capture.advanced_search 
            simple_search=$smarty.capture.simple_search 
            dispatch=$dispatch 
            view_type="departments"
            no_adv_link=true
        }

    </form>
</div>
