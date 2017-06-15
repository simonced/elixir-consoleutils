defmodule ConsoleUtilsTest do
  use ExUnit.Case
  doctest ConsoleUtils.Files
  
  #======================================================================
  # testing file selection separate module
  # (because I want ot share it with other projects)
  test "file selection" do
    files = ConsoleUtils.Files.lsReverseOrder("test/log", ".*")
    assert [{1, "file2.txt"}, {2, "file1.txt"}] == files

    # just testing my selection function
    assert {0, nil}         == ConsoleUtils.Files.chooseOneFile(0, files)
    assert {1, "file2.txt"} == ConsoleUtils.Files.chooseOneFile(1, files)
    assert {:error, nil}    == ConsoleUtils.Files.chooseOneFile(3, files)
  end

end
