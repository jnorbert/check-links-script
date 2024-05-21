#### Function Explanation: `check_links`

The `check_links` function performs the following tasks:

1. **Writes the header for the report**, including the current date and time, to the report file.
2. **Extracts all `href` values (links)** from the HTML content of the specified URL using `curl` and `sed`.
3. **Iterates over each extracted link**.
4. **Checks if the link is absolute or relative**:
   - If the link is relative, it adds the base URL to form a complete URL.
5. **Uses `curl` to measure the HTTP status code for each link**. The `curl` command is used with the following options:
   - `-o /dev/null`: Discards the output.
   - `-s`: Silent mode, which suppresses progress and error messages.
   - `-w "%{http_code}\n"`: Writes the HTTP status code to the variable.
   - `-L`: Follows redirects.
6. **Checks if the HTTP status code is `200`**. If it is, it appends a message stating the link is valid to the report file. Otherwise, it appends a message stating the link is invalid, along with the HTTP status code.
7. **Prints a message** indicating that the report has been saved.
