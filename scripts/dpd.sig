# TODO: Use this file to optionally declare signatures activating your analyzer
# (instead of, or in addition to, using a well-known port).
#
#signature dpd_btppl_tcp {
#    payload/^[\x00-\xff][\x00-\xff][\x00-\xff][\x00-\xff]/
#}
#
#signature dpd_btppl_tcp_request {
#    ip-proto == tcp
#    dst-port == 2504
#    requires-signature dpd_btppl_tcp
#}
#
#signature dpd_btppl_tcp_response {
#    ip-proto == tcp
#    src-port == 2504
#    requires-reverse-signature dpd_btppl_tcp_request
#    enable "spicy_BTPPL_TCP"
#}
#
#signature dpd_btppl_udp {
#    ip-proto == udp
#    dst-port == 3110
#    payload/^[\x00-\xff]/
#    enable "spicy_BTPPL_UDP"
#}
