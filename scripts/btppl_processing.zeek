@load ./utils

module BTPPL;

hook set_session_general_log(c: connection)
    {
    if ( ! c?$btppl_general_log )
        c$btppl_general_log = general_log(
            $ts=network_time(),
            $uid=c$uid,
            $id=c$id,
            $proto=get_conn_transport_proto(c$id));
    }

event BTPPL::MessageTcpEvt (c: connection, is_orig: bool, messagetcp: BTPPL::MessageTcp)
    {
    hook set_session_general_log(c);

    local info_general_log = c$btppl_general_log;

    info_general_log$message_tcp_bl = messagetcp$BL;
    info_general_log$header_hdr_len = messagetcp$header$HdrLen;
    info_general_log$header_flags_type = BTPPL_ENUM::TYPE[messagetcp$header$Flags$Type];
    info_general_log$header_flags_version = BTPPL_ENUM::VERSION[messagetcp$header$Flags$Version];
    info_general_log$header_flags_reserved = messagetcp$header$Flags$Reserved;
    info_general_log$header_flags_sha1 = BTPPL_ENUM::SHA1[messagetcp$header$Flags$Sha1];
    info_general_log$header_job_time = messagetcp$header$JobTime;
    info_general_log$header_job_time_ct = messagetcp$header$JobTimeCt;
    info_general_log$header_member = messagetcp$header$Member;
    info_general_log$header_o_type = messagetcp$header$OType;
    info_general_log$header_method = messagetcp$header$Method;
    info_general_log$header_z_nr = messagetcp$header$ZNr;
    info_general_log$header_f_nr = messagetcp$header$FNr;
    if (messagetcp$header?$Path)
        {
        info_general_log$header_path = UTILS::bytestring_to_hexvalues(messagetcp$header$Path);
        }
    if (messagetcp$body?$Parameters)
        {
        info_general_log$body_parameters = UTILS::bytestring_to_hexvalues(messagetcp$body$Parameters);
        }
    if (messagetcp$body?$ParametersSha1)
        {
        info_general_log$body_parameters = UTILS::bytestring_to_hexvalues(messagetcp$body$ParametersSha1);
        }
    if (messagetcp$body?$Utc)
        {
        info_general_log$body_utc = double_to_time(messagetcp$body$Utc);
        }
    if (messagetcp$body?$Sha1)
        {
        info_general_log$body_sha1 = UTILS::bytestring_to_hexvalues(messagetcp$body$Sha1);
        }
    info_general_log$body_fletcher = UTILS::bytestring_to_hexvalues(messagetcp$body$Fletcher);
    BTPPL::emit_btppl_general_log(c);
    }

event BTPPL::MessageUdpEvt (c: connection, is_orig: bool, messageudp: BTPPL::MessageUdp)
    {
    hook set_session_general_log(c);

    local info_general_log = c$btppl_general_log;

    info_general_log$header_hdr_len = messageudp$header$HdrLen;
    info_general_log$header_flags_type = BTPPL_ENUM::TYPE[messageudp$header$Flags$Type];
    info_general_log$header_flags_version = BTPPL_ENUM::VERSION[messageudp$header$Flags$Version];
    info_general_log$header_flags_reserved = messageudp$header$Flags$Reserved;
    info_general_log$header_flags_sha1 = BTPPL_ENUM::SHA1[messageudp$header$Flags$Sha1];
    info_general_log$header_job_time = messageudp$header$JobTime;
    info_general_log$header_job_time_ct = messageudp$header$JobTimeCt;
    info_general_log$header_member = messageudp$header$Member;
    info_general_log$header_o_type = messageudp$header$OType;
    info_general_log$header_method = messageudp$header$Method;
    info_general_log$header_z_nr = messageudp$header$ZNr;
    info_general_log$header_f_nr = messageudp$header$FNr;
    if (messageudp$header?$Path)
        {
        info_general_log$header_path = UTILS::bytestring_to_hexvalues(messageudp$header$Path);
        }
    if (messageudp$body?$Parameters)
        {
        info_general_log$body_parameters = UTILS::bytestring_to_hexvalues(messageudp$body$Parameters);
        }
    if (messageudp$body?$ParametersSha1)
        {
        info_general_log$body_parameters = UTILS::bytestring_to_hexvalues(messageudp$body$ParametersSha1);
        }
    if (messageudp$body?$Utc)
        {
        info_general_log$body_utc = double_to_time(messageudp$body$Utc);
        }
    if (messageudp$body?$Sha1)
        {
        info_general_log$body_sha1 = UTILS::bytestring_to_hexvalues(messageudp$body$Sha1);
        }
    info_general_log$body_fletcher = UTILS::bytestring_to_hexvalues(messageudp$body$Fletcher);
    BTPPL::emit_btppl_general_log(c);
    }
