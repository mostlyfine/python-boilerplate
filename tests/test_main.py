import sys

import main


def test_main_prints_python_version(capsys):
    main.main()
    captured = capsys.readouterr()
    assert captured.out == f"Python version: {sys.version}\n"
    assert captured.err == ""
