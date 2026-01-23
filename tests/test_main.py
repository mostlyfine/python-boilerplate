"""Tests for the main module."""

import sys

import main


def test_main_prints_python_version(capsys):
    """Test that main function prints the Python version."""
    main.main()
    captured = capsys.readouterr()
    assert captured.out == f"Python version: {sys.version}\n"
    assert captured.err == ""
