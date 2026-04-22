# @TEST-DOC: Test Zeek parsing a trace file through the BTPPL analyzer.
#
# @TEST-EXEC: zeek -Cr ${TRACES}/btppl_obj_c_udp.pcap ${PACKAGE} %INPUT
# @TEST-EXEC: btest-diff btppl_general_log.log
