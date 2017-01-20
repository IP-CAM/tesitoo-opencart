### GET products ###

**Method** `GET /api/v1/product/vendor/{id}/products`

Request products for a vendor, identified by vendor id.

**Request parameters**

* `include_expired` (optional) - if set to non-0, products with an expiration date in the past will also be included
