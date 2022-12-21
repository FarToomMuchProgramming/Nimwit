import asyncdispatch, strutils
import dimscord
import tokenhandler

type
    Config* = object
        prefix*: string
    
    ErrorType* = enum
        SYNTAX, LOGICAL, VALUE

    CommandCategory* = enum
        UNDEFINED, SYSTEM, SOCIAL, MATH, FUN

    Command* = object
        name*: string
        desc*: string

        category*: CommandCategory
        alias*: seq[string]
        usage*: seq[string]

        call*: proc(s: Shard, m: Message, args: seq[string]): Future[system.void] {.async.}


var CommandList* {.global.}: seq[Command]


# Discord:
setDiscordToken()
let discord* = newDiscordClient(getDiscordToken().strip())

export discord
