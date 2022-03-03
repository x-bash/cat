BEGIN{
    BRACKET="\033[35m"
    NUMBER="\033[32m"
    KEYWORD="\033[1;34m"
    UI_END="\033[0m"

    KEYWORD_LIST="function,print,BEGIN,END"
    KEYWORD_REPR = convert_keywordlist_to_keywordrepr( KEYWORD_LIST )
}

function convert_keywordlist_to_keywordrepr(list){
    arrl = split(list, arr, ",")
    for (i=1; i<=arrl; ++i)     KEYWORD_REPR = KEYWORD_REPR "|(" arr[i] ")"
    KEYWORD_REPR = substr( KEYWORD_REPR, 2 )
    return KEYWORD_REPR
}

function colorize( text ){
    gsub(/\{|\}|\[|\]|\(|\)/, BRACKET "&" UI_END, text)
    gsub(KEYWORD_REPR, KEYWORD "&" UI_END, text)
    return text
}

{
    print colorize( $0 )
}
