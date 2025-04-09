# Contributing to Cursor AI Editor Installer

Thank you for your interest in contributing to the Cursor AI Editor Installer! This document provides guidelines and instructions for contributing.

## Code of Conduct

Please help keep this project open and inclusive. By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

- **Ensure the bug was not already reported** by searching on GitHub under [Issues](https://github.com/MaheshTechnicals/cursor-installer/issues).
- If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/MaheshTechnicals/cursor-installer/issues/new). Be sure to include a **title and clear description**, as much relevant information as possible, and a **code sample** or an **executable test case** demonstrating the expected behavior that is not occurring.

### Suggesting Enhancements

- **Check if the enhancement has already been suggested** by searching on GitHub under [Issues](https://github.com/MaheshTechnicals/cursor-installer/issues).
- If it hasn't, [create a new issue](https://github.com/MaheshTechnicals/cursor-installer/issues/new) with a clear title and description of the suggested enhancement.

### Pull Requests

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes (maintain coding style and add comments)
4. Test your changes thoroughly
5. Commit your changes (`git commit -m 'Add some amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Development Guidelines

### Bash Scripting Style Guide

- Use 4 spaces for indentation (not tabs)
- Add comments to explain complex logic
- Use meaningful variable names
- Use `function_name() {` style for function declarations
- Quote all variables that might contain spaces
- Use `[[` and `]]` for test conditions
- Follow command grouping with `{ command1; command2; }`
- Add error handling for critical operations

### Testing

- Test on both Android (via Termux) and Linux platforms
- Verify compatibility with different architectures (ARM64 and x86_64)
- Check for proper handling of error conditions
- Ensure proper cleanup on interruptions

## Release Process

1. Update the version number in the script
2. Update CHANGELOG.md with details of changes
3. Create a pull request for review
4. Once approved, merge to main branch
5. Create a new GitHub release with appropriate tag

---

Thank you for contributing to make the Cursor AI Editor Installer better! 