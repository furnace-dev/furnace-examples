from collections import Dict, List
from pathlib import cwd
from os import setenv
from os.path import exists

# https://github.com/itsdevcoffee/mojoenv (Original implementation)


struct MojoEnvParser:
    var env_contents: String
    var env_contents_lines: List[String]
    var env_vars: Dict[String, String]

    fn __init__(inout self, env_contents: String = ""):
        self.env_contents = env_contents
        self.env_contents_lines = self.parse_env_lines(env_contents)
        self.env_vars = Dict[String, String]()

    @staticmethod
    fn parse_env_lines(env_contents: String = "") -> List[String]:
        return env_contents.splitlines(0)

    fn parse_env_lines(inout self) -> List[String]:
        self.env_contents_lines = self.env_contents.splitlines(0)
        return self.env_contents_lines

    fn parse_env_key_values(
        inout self, should_def: Bool = False
    ) raises -> Dict[String, String]:
        var env_contents_lines = self.parse_env_lines()
        for line in env_contents_lines:
            # Strip whitespace and ignore comments
            var stripped_line: String = line[].strip()

            if stripped_line and not stripped_line.startswith("#"):
                # Split at the first '=' to separate key and value
                var key_value = stripped_line.split("=", 1)

                # Strip any additional whitespace around the key and value
                var key = key_value[0].strip()
                var value = key_value[1].strip().strip('"').strip(
                    "'"
                )  # Remove quotes if present
                self.env_vars[key] = value
                if should_def:
                    _ = setenv(key, value, 1)

        return self.env_vars


fn load_mojo_env(
    env_path: String = ".env", should_append_cwd: Bool = True
) -> Dict[String, String]:
    """
    Loads environment variables from a .env file and sets them in the current process environment.

    This function reads a .env file, parses its contents, and sets each key-value pair
    as an environment variable using the operating system's setenv function. It also
    returns a dictionary containing all the parsed environment variables.

    Args:
        env_path: Path to the .env file. Defaults to '.env' in the current directory.
        should_append_cwd: If True, appends the current working directory to the env_path
                           when env_path is not '.env'. Defaults to True.

    Returns:
        Dict[String, String]: A dictionary containing all parsed environment variables.

    Note:
        - If env_path is '.env', the function looks for the file in the same directory as the script.
        - If env_path is not '.env' and should_append_cwd is True, the function prepends the current
          working directory to the provided env_path.
        - The function ignores empty lines and comments (lines starting with '#') in the .env file.
        - It strips whitespace and quotes from both keys and values.
        - Existing environment variables with the same names will be overwritten.
    """
    var mojoenv_parser = MojoEnvParser()

    try:
        var path = cwd() / env_path if env_path == ".env" else env_path
        if env_path != ".env" and should_append_cwd:
            path = cwd() / env_path

        var does_exist = exists(path)
        if not does_exist:
            raise Error(String("env_path does not exist -> {}").format(path))

        var env_contents: String

        with open(path, "r") as env_file:
            env_contents = env_file.read()

        mojoenv_parser.env_contents = env_contents

        _ = mojoenv_parser.parse_env_key_values(True)

    except e:
        print("Issue loading mojo env vars:", e)

    return mojoenv_parser.env_vars
