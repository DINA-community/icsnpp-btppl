module UTILS;

export {
    ## Function to format a string in hex format
    global bytestring_to_hexvalues: function(data: string): string;
}

## Function to format a string in hex format
function UTILS::bytestring_to_hexvalues(data: string): string
    {
    local hex = "";
    for ( i in data )
        {
        hex += "0x";
        hex += bytestring_to_hexstr(i);
        hex += " ";
        }
    return hex;
    }
