# Derived from libc errlist.awk

BEGIN {
	printf("/* This file is automatically generated by error.awk */\n\n");
	printf("#include \"inc.h\"\n\n");
	printf("static const char *const errors[] = {\n");
}
/^#define/ {
	name = $2;
	if (name == "ELAST")
		next;
	number = $3;
	if (number == "(_SIGN")
		number = $4;
	if (number < 0 || number == "EAGAIN")
		next;
	printf("\t[%s] = \"%s\",\n", name, name);
}
END {
	printf("};\n\n");
	printf("const char *\nget_error_name(int err)\n{\n\n");
	printf("\tif (err >= 0 && err < sizeof(errors) / sizeof(errors[0]) &&\n");
	printf("\t    errors[err] != NULL)\n");
	printf("\t\treturn errors[err];\n");
	printf("\telse\n");
	printf("\t\treturn NULL;\n");
	printf("}\n");
}
