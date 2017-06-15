
defmodule ConsoleUtils.Files do

  @moduledoc"""
  usage:
    {number, file} = ConsoleUtils.Files.lsReverseOrder("folder", ".*")
                     |> ConsoleUtils.Files.chooseOneFileMenu()

    case number do
      :error -> IO.puts "File Error"
      0 -> IO.puts "Exit"
      _ -> TODO(file)
    end

  TODO: handle the regex for filtering files
  """


  #======================================================================
  # list and format of log files
  def consoleFormatLogsList(files, index \\ 1)

  def consoleFormatLogsList([], _), do: []

  def consoleFormatLogsList([file_| list_], index_) do
    [{index_, file_} | consoleFormatLogsList( list_, index_+1)]
  end


  # ======================================================================
  def consoleFormatLogsDisplay([]), do: ""

  # Display a file list one line per file with numbers
  # @param files[] list of files already in display order
  # @return line with one file and it's number: "1 : filename"
  def consoleFormatLogsDisplay([{index_, file_}|list_]) do
    "#{index_} : #{file_}\n" <> consoleFormatLogsDisplay(list_)
  end


  #======================================================================
  # listing files in directory (listing in reverse order)
  # mainly for listings of log files
  # TODO filter files with pattern_
  # @param path_ string : where to search files
  # @param pattern_ regex : NOT USED
  # @return list [{1, "zzz", 2, "yyy"}...]
  def lsReverseOrder(path_, _pattern_) do

    File.ls!(path_)
    |> Enum.sort()
    |> Enum.reverse()
    |> consoleFormatLogsList()
    #IO.inspect files

  end


  def chooseOneFileMenu(files_) do
    IO.puts "0 : Exit"
    IO.puts consoleFormatLogsDisplay(files_)
    IO.puts "File number:"

    # wait for input
    {number, _} = IO.read(:line) |> String.strip |> Integer.parse

    chooseOneFile(number, files_)
  end


  # @return a tuple {x, file} if correct file number (x integer, file string)
  # @return a tuple {0, nil} user exit the menu
  # @return a tuple {:error, nil} in case of error
  def chooseOneFile(number_, files_) do
    result = case number_ do
      0 -> {0, nil}
      x when x < length(files_) -> Enum.at(files_, number_ - 1)
      _ -> {:error, nil}
    end
    #IO.puts "You selected file: #{file}"
    #IO.inspect result

    result
  end

end
