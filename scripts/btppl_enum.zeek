module BTPPL_ENUM;

export {
    const VERSION = {
        [BTPPL_ENUM::Version_VERSION_1]     = "OCIT-Outstations-BTPPL Version 1",
        [BTPPL_ENUM::Version_RESERVED_1]    = "OCIT-Outstations-BTPPL reserved",
        [BTPPL_ENUM::Version_RESERVED_2]    = "OCIT-Outstations-BTPPL reserved",
        [BTPPL_ENUM::Version_RESERVED_3]    = "OCIT-Outstations-BTPPL reserved"
    } &default=function(i: BTPPL_ENUM::Version):string{return fmt("unknown-0x%x", i); } &redef;

    const TYPE = {
        [BTPPL_ENUM::Type_REQUEST]      = "Telegram type Request",
        [BTPPL_ENUM::Type_RESPOND]      = "Telegram type Response",
        [BTPPL_ENUM::Type_MESSAGE]      = "Telegram type Message",
        [BTPPL_ENUM::Type_RESERVED_3]   = "Telegram type reserved",
        [BTPPL_ENUM::Type_RESERVED_4]   = "Telegram type reserved",
        [BTPPL_ENUM::Type_RESERVED_5]   = "Telegram type reserved",
        [BTPPL_ENUM::Type_RESERVED_6]   = "Telegram type reserved",
        [BTPPL_ENUM::Type_RESERVED_7]   = "Telegram type reserved",
        [BTPPL_ENUM::Type_RESERVED_8]   = "Telegram type reserved"
    } &default=function(i: BTPPL_ENUM::Type):string{return fmt("unknown-0x%x", i); } &redef;

    const SHA1 = {
        [BTPPL_ENUM::Sha1_without_sha1] = "without Sha1",
        [BTPPL_ENUM::Sha1_with_sha1]    = "with Sha1"
    } &default=function(i: BTPPL_ENUM::Sha1):string{return fmt("unknown-0x%x", i); } &redef;

}
