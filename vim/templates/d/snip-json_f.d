    File fd = new File({{_input_:file}},FileMode.In);
    string j_ctx = to!(string)( fd.readString( fd.available() ) );
    JSONValue json = parseJSON(j_ctx).object;
//    {{_cursor_}}
