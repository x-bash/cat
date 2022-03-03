BEGIN{
    BRACKET="\033[35m"
    TH_NUMBER="\033[32m"
    KEYWORD="\033[1;34m"
    SYMBOL="\033[33m"
    UI_END="\033[0m"

    KEYWORD_LIST="function,print,BEGIN,END,return"
    KEYWORD_REPR = convert_keywordlist_to_keywordrepr( KEYWORD_LIST )

    SYMBOL_LIST="\\+\\+,\\+=,-=,--,="
    SYMBOL_REPR = convert_keywordlist_to_keywordrepr( SYMBOL_LIST )
    # print SYMBOL_REPR
}

function convert_keywordlist_to_keywordrepr(list, KEYWORD_REPR){
    arrl = split(list, arr, ",")
    for (i=1; i<=arrl; ++i)     KEYWORD_REPR = KEYWORD_REPR "|(" arr[i] ")"
    KEYWORD_REPR = substr( KEYWORD_REPR, 2 )
    return KEYWORD_REPR
}

function colorize( text ){
    gsub(/[0-9]+/, TH_NUMBER "&" UI_END, text)
    gsub(/(^|\s+|[^\033])\[/, BRACKET "&" UI_END, text)
    gsub(/\{|\}|\]|\(|\)/, BRACKET "&" UI_END, text)
    # gsub("(+|-)[0-9]+(\.[0-9]+)?", NUMBER "&" UI_END, text)

    gsub(SYMBOL_REPR, SYMBOL "&" UI_END, text)
    gsub(KEYWORD_REPR, KEYWORD "&" UI_END, text)


    return text
}

{
    print colorize( $0 )
}
