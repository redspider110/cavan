/*
 * Author: Fuang.Cao
 * Email: cavan.cfa@gmail.com
 * Date: Sat Jan 14 14:09:50 CST 2012
 */

#include <cavan.h>
#include <cavan/tcp_tftp.h>

#define FILE_CREATE_DATE "2012-01-14 14:09:50"

enum
{
	LOCAL_COMMAND_OPTION_UNKNOWN,
	LOCAL_COMMAND_OPTION_HELP,
	LOCAL_COMMAND_OPTION_VERSION,
};

static void show_usage(void)
{
	println("Usage:");
}

int main(int argc, char *argv[])
{
	int c;
	int option_index;
	struct option long_option[] =
	{
		{
			.name = "help",
			.has_arg = no_argument,
			.flag = NULL,
			.val = LOCAL_COMMAND_OPTION_HELP,
		},
		{
			.name = "version",
			.has_arg = no_argument,
			.flag = NULL,
			.val = LOCAL_COMMAND_OPTION_VERSION,
		},
		{
		},
	};

	while ((c = getopt_long(argc, argv, "vVhH", long_option, &option_index)) != EOF)
	{
		switch (c)
		{
		case 'v':
		case 'V':
		case LOCAL_COMMAND_OPTION_VERSION:
			show_author_info();
			println(FILE_CREATE_DATE);
			return 0;

		case 'h':
		case 'H':
		case LOCAL_COMMAND_OPTION_HELP:
			show_usage();
			return 0;

		default:
			show_usage();
			return -EINVAL;
		}
	}

	return tcp_tftp_service_run(TCP_TFTP_SERVER_PORT);
}