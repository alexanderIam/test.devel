{if $departments}
    {script src="js/tygh/exceptions.js"}

    {if !$no_pagination}
        {include "common/pagination.tpl"}
    {/if}

    {if !$show_empty}
        {split data=$departments size=$columns|default:"2" assign="splitted_departments"}
    {else}
        {split data=$departments size=$columns|default:"2" assign="splitted_departments" skip_complete=true}
    {/if}

    {math equation="100 / x" x=$columns|default:"2" assign="cell_width"}
    {script src="js/tygh/product_image_gallery.js"}
    <div class="grid-list">
        {strip}
            {foreach $splitted_departments as $departments}
                {foreach $departments as $department}
                    <div class="ty-column{$columns}">
                        {if $department}
                            {$obj_id = $department.department}
                            {$obj_id_prefix = "`$department.firstname` `$department.lastname`"}
                            <div class="ty-grid-list__item ty-quick-view-button__wrapper ">
                                {foreach $collection.main_pair.icon as $im_path}
                                    $collection.main.pair[key($im_path)] = value($im_path)
                                {/foreach}
                                <div class="ty-grid-list__image">
                                    <a href="{"departments.department?department_id={$department.department_id}"|fn_url }">
                                        {include "common/image.tpl" 
                                            no_ids=true
                                            images=$department.main_pair
                                            image_width=$settings.Thumbnails.product_lists_thumbnail_width 
                                            image_height=$settings.Thumbnails.product_lists_thumbnail_height 
                                            lazy_load=false
                                        }
                                    </a>
                                </div>
                                <div class="ty-grid-list__item-name">
                                    <bdi>
                                        <a href="{"departments.department?department_id={$department.department_id}"|fn_url}"
                                            class="product-title" title="{$obj_id}">{$obj_id}</a>
                                    </bdi>
                                </div>
                                   <div class="ty-grid-list__item-name">
                                   <bdi>
                                        <div class="">
                                            {if $department.admin_id>0}
                                            {$obj_id_prefix}
                                            {else}
                                            {__("department_not_assigned")}
                                            {/if}
                                        </div>
                                   </bdi>
                                </div>
                            </div>
                        {/if}
                    </div>
                {/foreach}
            {/foreach}
        {/strip}
    </div>

    {if !$no_pagination}
        {include "common/pagination.tpl"}
    {/if}

{/if}

{capture name="mainbox_title"}{$title}{/capture}
