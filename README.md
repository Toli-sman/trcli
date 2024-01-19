# TestRail CLI (trcli) Docker Image

This Docker image provides an environment with the latest TestRail CLI tool (`trcli`). The TestRail CLI is a command-line interface for interacting with TestRail, a test management tool. It enables you to perform various operations such as creating test runs, adding test results, and retrieving test case information.

## Image Details

- **Image Base:** Python `3.12-slim-bookworm`
- **Maintainer:** [Tolisman](https://github.com/Toli-sman)
- **TestRail CLI Version:** 1.8.0
- **Python Version:** 3.12-slim-bookworm
- **GitHub Repository:** [trcli](https://github.com/Toli-sman/trcli.git)

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your system.

### Building the Docker Image

```bash
docker build -t trcli-docker .
```

### Running the Docker Container

```bash
cd /path/to/project
docker run -it trcli-docker -v ${PWD}:/home/developer/build 
```

### Example Usage

The provided Docker image includes an example command demonstrating how to use the TestRail CLI. This command adds results for specific test cases to a test run.

```bash
testrail add_results_for_cases --run-id 3 --results "1:Passed,2:Failed,3:Blocked" --comments "1:This test passed successfully,2:This test failed due to a bug,3:This test is blocked"
```

## Configuration

Before using the TestRail CLI, make sure to configure it with your TestRail credentials. You can find more information on how to configure the CLI and available commands in the [TestRail documentation](https://www.gurock.com/testrail/docs/api/getting-started).

## Notes

- This Docker image includes essential dependencies and tools commonly used in testing environments.
- The provided example command is for demonstration purposes. Adjust the parameters based on your TestRail project configuration.

## Issues and Contributions

If you encounter any issues with the Docker image or have suggestions for improvements, feel free to [open an issue](https://github.com/Toli-sman/trcli/issues) on the GitHub repository.

Happy testing! 🚀
