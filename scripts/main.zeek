##! main.zeek
##!
##! ICSNPP-BTPPL
##!
##! Zeek script type/record definitions describing the information
##! that will be written to the log files.
##!

module BTPPL;

export {
    redef enum Log::ID += { LOG_GENERAL_LOG };

    global log_general_log: event(rec: general_log);
    global log_policy_general_log: Log::PolicyHook;
    global emit_btppl_general_log: function(c: connection);

}

# redefine connection record to contain one of each of the btppl records
redef record connection += {
    btppl_general_log: general_log &optional;
};

# Define tcp ports
const tcp_ports = {
    2504/tcp,
};

# Define udp ports
const udp_ports = {
    3110/udp,
};

# Initialization Function
event zeek_init() &priority=5
    {
    # initialize logging streams for all btppl logs
    Log::create_stream(BTPPL::LOG_GENERAL_LOG,
    [$columns=general_log,
    $ev=log_general_log,
    $path="btppl_general_log",
    $policy=log_policy_general_log]);
    Analyzer::register_for_ports(Analyzer::ANALYZER_SPICY_BTPPL_TCP, tcp_ports);
    Analyzer::register_for_ports(Analyzer::ANALYZER_SPICY_BTPPL_UDP, udp_ports);
    }

function emit_btppl_general_log(c: connection)
    {
    if (! c?$btppl_general_log )
        return;
    Log::write(BTPPL::LOG_GENERAL_LOG, c$btppl_general_log);
    delete c$btppl_general_log;
    }
