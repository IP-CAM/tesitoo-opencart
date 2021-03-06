<?php

class ControllerCommonVendorTermsAPI extends ApiController {

	public function index($args = array()) {
		if($this->request->isGetRequest()) {
			$this->get();
		}
	}

	public function get() {
		$action = new Action('common/vendor_terms');
		$data = $action->execute($this->registry);

		$response['vendor_terms'] = $data['vendor_terms'];

		$this->response->setOutput($response);
	}

}

?>
