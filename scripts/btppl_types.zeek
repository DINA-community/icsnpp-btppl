module BTPPL;

export {
    type general_log: record {
        ts                      : time &log;
        uid                     : string &log;
        id                      : conn_id &log;
        proto                   : transport_proto &log;
        message_tcp_bl          : count &log &optional;
        header_hdr_len          : count &log &optional;
        header_flags_type       : string &log &optional;
        header_flags_version    : string &log &optional;
        header_flags_reserved   : count &log &optional;
        header_flags_sha1       : string &log &optional;
        header_job_time         : count &log &optional;
        header_job_time_ct      : count &log &optional;
        header_member           : count &log &optional;
        header_o_type           : count &log &optional;
        header_method           : count &log &optional;
        header_z_nr             : count &log &optional;
        header_f_nr             : count &log &optional;
        header_path             : string &log &optional;
        body_parameters         : string &log &optional;
        body_utc                : time &log &optional;
        body_sha1               : string &log &optional;
        body_fletcher           : string &log &optional;
    };

}
