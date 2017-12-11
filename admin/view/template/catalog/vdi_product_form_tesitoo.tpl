<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
			<!--mvds-->
			<?php if ($mvd_vendor_tab) { ?>
			<li><a href="#tab-vendor" data-toggle="tab"><?php echo $tab_vendor; ?></a></li>
			<?php } ?>
			<!--mvde-->
			<?php if ($mvd_reward_points) { ?>
            <li><a href="#tab-reward" data-toggle="tab"><?php echo $tab_reward; ?></a></li>
			<?php } ?>
			<?php if ($mvd_design_tab) { ?>
            <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
			<?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                <div class="col-sm-10">
                  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                </div>
              </div>
			   <!--mvds-->
			  <input type="hidden" name="product_name" size="100" value="<?php echo $product_name; ?>" />
			  <input type="hidden" name="pending_status" size="100" value="<?php echo $status; ?>" />
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
				  <?php if ($mvd_product_approval) { ?>
                    <?php if ($status != 5) { ?>
					  <?php if ($status) { ?>
					  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					  <option value="0"><?php echo $text_disabled; ?></option>
					  <?php } else { ?>
					  <option value="1"><?php echo $text_enabled; ?></option>
					  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					  <?php } ?>
					<?php } else { ?>
					  <option value="5" selected="selected"><?php echo $txt_pending_approval; ?></option>
					<?php } ?>
				  <?php } else { ?>
					 <?php if ($status) { ?>
					  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					  <option value="0"><?php echo $text_disabled; ?></option>
					  <?php } else { ?>
					  <option value="1"><?php echo $text_enabled; ?></option>
					  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					  <?php } ?>
					<?php } ?>
                  </select>
                </div>
               </div>
			  <!--mvde-->
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-location"><?php echo $entry_location; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="location" value="<?php echo $location; ?>" placeholder="<?php echo $entry_location; ?>" id="input-location" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                </div>
              </div>

              <?php if ($shipping) { ?>
                <input type="hidden" name="shipping" value="1" />
              <?php } ?>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-minimum"><span data-toggle="tooltip" title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="minimum" value="<?php echo $minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-minimum" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length"><?php echo $entry_dimension; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-4">
                      <input type="text" name="length" value="<?php echo $length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-expiration-date"><?php echo $entry_expiration_date; ?></label>
                <div class="col-sm-3">
                  <div class="input-group date">
                    <input type="text" name="expiration_date" value="<?php echo $expiration_date; ?>" placeholder="<?php echo $entry_date_available; ?>" data-date-format="YYYY-MM-DD" id="input-expiration-date" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-unit-class"><?php echo $entry_unit_class; ?></label>
                <div class="col-sm-10">
                  <select name="unit_class_id" id="input-unit-class" class="form-control">
                    <?php foreach ($unit_classes as $unit_class) { ?>
                    <?php if ($unit_class['unit_class_id'] == $unit_class_id) { ?>
                    <option value="<?php echo $unit_class['unit_class_id']; ?>" selected="selected"><?php echo $unit_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $unit_class['unit_class_id']; ?>"><?php echo $unit_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-custom-unit"><?php echo $entry_custom_unit; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="product_description[1][custom_unit]" value="<?php echo isset ($product_description[1]['custom_unit']) ? $product_description[1]['custom_unit'] : ''; ?>" placeholder="<?php echo $entry_custom_unit; ?>" id="input-custom-unit" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="length_class_id" id="input-length-class" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
			<!--mvds-->
			<?php if ($mvd_vendor_tab) { ?>
			<div class="tab-pane" id="tab-vendor">
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-vendor-id"><?php echo $entry_vendor_name; ?></label>
                <div class="col-sm-10">
                  <?php foreach ($vendors as $vd) { ?>
					<?php if ($vendor) { ?>
						<?php if ($vd['vendor_id'] == $vendor) { ?>
							<?php echo $vd['vendor_name']; ?>
							<input id="vendor" type="hidden" name="vendor" value="<?php echo $vd['vendor_id']; ?>" onchange="getVendors();" />
						<?php } ?>
					<?php } else { ?>
						<?php if ($vd['vendor_id'] == $default_vendor) { ?>
							<?php echo $vd['vendor_name']; ?>
							<input id="vendor" type="hidden" name="vendor" value="<?php echo $vd['vendor_id']; ?>" onchange="getVendors();" />
						<?php } ?>
					<?php } ?>
					<?php } ?>
                </div>
              </div>
			  <div class="form-group">
			  <label class="col-sm-2 control-label" for="input-ori-country"><span data-toggle="tooltip" title="<?php echo $help_vendor_country_origin; ?>"><?php echo $entry_vendor_country_origin; ?></span></label>
                <div class="col-sm-10">
			      <select name="ori_country" id="input-ori-country" class="form-control">
					<option value="0" selected="selected"><?php echo $text_none; ?></option>
					<?php foreach ($countries as $country) { ?>
					<?php if ($ori_country) { ?>
						<?php if ($country['country_id'] == $ori_country) { ?>
						<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
					<?php } ?>
					<?php } else { ?>
						<?php if ($country['country_id'] == $default_country) { ?>
						<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
						<?php } ?>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-product-cost"><?php echo $entry_vendor_product_cost; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="product_cost" value="<?php echo $product_cost; ?>" placeholder="<?php echo $entry_vendor_product_cost; ?>" onKeyUp="total_cost()" id="input-product-cost" class="form-control" />
                </div>
              </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-shipping-method"><span data-toggle="tooltip" title="<?php echo $help_vendor_shipping_method; ?>"><?php echo $entry_vendor_shipping_method; ?></span></label>
				<div class="col-sm-10">
				  <select name="shipping_method" id="input-shipping-method" class="form-control">
					<option value="0" selected="selected"><?php echo $text_none; ?></option>
					<?php foreach ($couriers as $courier) { ?>
					<?php if ($courier['courier_id'] == $shipping_method) { ?>
						<option value="<?php echo $courier['courier_id']; ?>" selected="selected"><?php echo $courier['courier_name']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $courier['courier_id']; ?>"><?php echo $courier['courier_name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-preferred-method"><span data-toggle="tooltip" title="<?php echo $help_vendor_preferred_shipping_method; ?>"><?php echo $entry_vendor_preferred_shipping_method; ?></span></label>
				<div class="col-sm-10">
				  <select name="preferred_shipping" id="input-ori-country" class="form-control">
					<option value="0" selected="selected"><?php echo $text_none; ?></option>
					<?php foreach ($couriers as $courier) { ?>
					<?php if ($courier['courier_id'] == $preferred_shipping) { ?>
						<option value="<?php echo $courier['courier_id']; ?>" selected="selected"><?php echo $courier['courier_name']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $courier['courier_id']; ?>"><?php echo $courier['courier_name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-shipping-cost"><?php echo $entry_vendor_shipping_cost; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="shipping_cost" value="<?php echo $shipping_cost; ?>" placeholder="<?php echo $entry_vendor_product_cost; ?>" onKeyUp="total_cost()" id="input-shipping-cost" class="form-control" />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-vtotal"><span data-toggle="tooltip" title="<?php echo $help_vendor_total; ?>"><?php echo $entry_vendor_total; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="vtotal" value="<?php echo $vtotal; ?>" placeholder="<?php echo $help_vendor_total; ?>" onKeyUp="procost()" id="input-vtotal" class="form-control" />
				</div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-vendor-product-url"><?php echo $entry_vendor_product_url; ?></label>
                <div class="col-sm-10">
				  <textarea name="product_url" rows="5" placeholder="<?php echo $entry_vendor_product_url; ?>" class="form-control"><?php echo $product_url; ?></textarea>
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-vendor-wholesale"><?php echo $entry_vendor_wholesale; ?></label>
                <div class="col-sm-10">
				  <textarea name="wholesale" rows="5" placeholder="<?php echo $entry_vendor_wholesale; ?>" class="form-control"><?php echo $wholesale; ?></textarea>
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_vendor_company; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_vendor_company; ?>" id="input-company" class="form-control" disabled />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-vname"><?php echo $entry_vendor_contact_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="vname" value="<?php echo $vname; ?>" placeholder="<?php echo $entry_vendor_contact_name; ?>" id="input-vname" class="form-control" disabled />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_vendor_telephone; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_vendor_telephone; ?>" id="input-telephone" class="form-control" disabled />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_vendor_fax; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_vendor_fax; ?>" id="input-fax" class="form-control" disabled />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_vendor_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_vendor_email; ?>" id="input-email" class="form-control" disabled />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-paypal-email"><?php echo $entry_vendor_paypal_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="paypal_email" value="<?php echo $paypal_email; ?>" placeholder="<?php echo $entry_vendor_paypal_email; ?>" id="input-paypal-email" class="form-control" disabled />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-vendor-description"><?php echo $entry_vendor_description; ?></label>
                <div class="col-sm-10">
				  <textarea name="vendor_description" rows="5" id="input-vendor-description" placeholder="<?php echo $entry_vendor_description; ?>" class="form-control" disabled><?php echo $vendor_description; ?></textarea>
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-vendor-address"><?php echo $entry_vendor_address; ?></label>
                <div class="col-sm-10">
				  <input type="text" name="vendor_address" value="<?php echo $vendor_address; ?>" placeholder="<?php echo $entry_vendor_address; ?>" id="input-vendor-address" class="form-control" disabled />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-vendor-country-zone"><?php echo $entry_vendor_country_zone; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="vendor_country_zone" value="<?php echo $vendor_country_zone; ?>" placeholder="<?php echo $entry_vendor_country_zone; ?>" id="input-vendor-country-zone" class="form-control" disabled />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-2 control-label" for="input-store-url"><?php echo $entry_vendor_store_url; ?></label>
                <div class="col-sm-10">
				  <input type="text" name="store_url" value="<?php echo $store_url; ?>" placeholder="<?php echo $entry_vendor_store_url; ?>" id="input-store-url" class="form-control" disabled />
                </div>
              </div>
			</div>
			<?php } else { ?>
			<?php foreach ($vendors as $vend) { ?>
				<?php if ($vendor) { ?>
					<?php if ($vend['vendor_id'] == $vendor) { ?>
						<input id="vendor" type="hidden" name="vendor" value="<?php echo $vend['vendor_id']; ?>" />
					<?php } ?>
				<?php } else { ?>
					<?php if ($vend['vendor_id'] == $default_vendor) { ?>
						<input id="vendor" type="hidden" name="vendor" value="<?php echo $vend['vendor_id']; ?>" />
					<?php } ?>
				<?php } ?>
			<?php } ?>
			<?php } ?>



              <div class="form-group">
				<label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
				<div class="col-sm-10">
				  <div class="well well-sm" style="height: 150px; overflow: auto;">
					<?php foreach ($categories as $category) { ?>
					<div class="checkbox">
					  <label>
						<?php if ($category_access) { ?>
							<?php if (in_array($category['category_id'], $category_access)) { ?>
								<?php if ($product_category) { ?>
									<?php if (in_array($category['category_id'], $product_category)) { ?>
										<input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" /><?php echo $category['name']; ?>
									<?php } else { ?>
										<input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" /><?php echo $category['name']; ?>
									<?php } ?>
								<?php } else { ?>
									<input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" /><?php echo $category['name']; ?>
								<?php } ?>
							<?php } ?>
						<?php } else { ?>
							<?php if (in_array($category['category_id'], $product_category)) { ?>
								<input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" /><?php echo $category['name']; ?>
							<?php } else { ?>
								<input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" /><?php echo $category['name']; ?>
							<?php } ?>
						<?php } ?>
					  </label>
					</div>
					<?php } ?>
				  </div>
				  <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
				</div>
			  </div>
              <div class="form-group" style="display: none;">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
					  <?php if ($store_permission) { ?>
						  <?php if (in_array(0,$store_permission)) { ?>
							<?php if (in_array(0, $product_store)) { ?>
							<input type="checkbox" name="product_store[]" value="0" checked="checked" />
							<?php echo $text_default; ?>
							<?php } else { ?>
							<input type="checkbox" name="product_store[]" value="0" />
							<?php echo $text_default; ?>
							<?php } ?>
						  <?php } ?>
						<?php } else { ?>
							<?php if (in_array(0, $product_store)) { ?>
							<input type="checkbox" name="product_store[]" value="0" checked="checked" />
							<?php echo $text_default; ?>
							<?php } else { ?>
							<input type="checkbox" name="product_store[]" value="0" />
							<?php echo $text_default; ?>
							<?php } ?>
						<?php } ?>
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_image; ?></td>
                      <td class="text-right"><?php echo $entry_sort_order; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $image_row = 0; ?>
                    <?php foreach ($product_images as $product_image) { ?>
                    <tr id="image-row<?php echo $image_row; ?>">
                      <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                      <td class="text-right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                      <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $image_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>


          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
//--></script>
  <script type="text/javascript"><!--
// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					manufacturer_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['manufacturer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'manufacturer\']').val(item['label']);
		$('input[name=\'manufacturer_id\']').val(item['value']);
	}
});

// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/vdi_category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');

		$('#product-category' + item['value']).remove();

		$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Filter
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');

		$('#product-filter' + item['value']).remove();

		$('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-filter').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Downloads
$('input[name=\'download\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/vdi_download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['download_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'download\']').val('');

		$('#product-download' + item['value']).remove();

		$('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-download').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Related
$('input[name=\'related\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/vdi_product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'related\']').val('');

		$('#product-related' + item['value']).remove();

		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
  <script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#images tbody').append(html);

	image_row++;
}
//--></script>
  <script type="text/javascript"><!--

//--></script>
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
<!--mvds-->
<script type="text/javascript"><!--
function getVendors() {
	$.ajax({
		url: 'index.php?route=catalog/vdi_product/vendor&token=<?php echo $token; ?>&vendor_id=' + $('#input-vendor-id').prop('value'),
		dataType: 'json',
		beforeSend: function() {
		$('select[name=\'vendor\']').after('<i class="fa fa-circle-o-notch fa-spin"></i>');
	},

	complete: function() {
		$('.fa-spin').remove();
	},

	success: function(data) {
		if (data['vendor_name']) {
			$("#input-company").val(data['vendor_name']);
			$("#input-vname").val(data['vname']);
			$("#input-telephone").val(data['telephone']);
			$("#input-fax").val(data['fax']);
			$("#input-email").val(data['email']);
			$("#input-paypal-email").val(data['paypal_email']);
			$("#input-vendor-description").val(data['vendor_description']);
			$("#input-vendor-address").val(data['address']);
			$("#input-vendor-country-zone").val(data['zone_name'][0] + ', ' + data['country_name'][0]);
			$("#input-store-url").val(data['store_url']);
		} else {
			$("#input-company").val('');
			$("#input-vname").val('');
			$("#input-telephone").val('');
			$("#input-fax").val('');
			$("#input-email").val('');
			$("#input-paypal-email").val('');
			$("#input-vendor-description").val('');
			$("#input-vendor-address").val('');
			$("#input-vendor-country-zone").val('');
			$("#input-store-url").val('');
		}
	}
	});
}
//--></script>

<?php if ($mvd_vendor_tab) { ?>
<script type="text/javascript"><!--
function total_cost() {
	if ($('#input-product-cost').prop('value') != '' && $('#input-product-cost').prop('value') >= '0') {
		if ($('#input-shipping-cost').prop('value') != '' && $('#input-shipping-cost').prop('value') >='0') {
			var totalc = parseFloat($('#input-product-cost').prop('value')) + parseFloat($('#input-shipping-cost').prop('value'))
			$("#input-vtotal").val(totalc);
			$("#input-price").val(totalc);
		}
	}
}
getVendors();
//--></script>
<?php } ?>
<!--mvde-->
<script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>
