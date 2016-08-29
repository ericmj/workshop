ExUnit.start(formatters: [ShouldI.CLIFormatter])

Path.join([__DIR__, "chat", "forge.exs"])
|> Code.require_file()
