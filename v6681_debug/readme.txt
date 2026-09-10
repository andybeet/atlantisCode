The "debug" refers to a small change in the code to prevent checking that values are proportions
Escapement values were altered to allow for fleet parameterization.

Change: atlantis/atlantisUtil/atlantisUtilsXML.c

Around line 163 the following should read:

        { "EscapeCoefficient", Ka_escape_id, "^Ka_escape_", no_checking, 1.0, SP_FISHED },
        { "EscapeExponent", Kb_escape_id, "^Kb_escape_", no_checking, 1.0, SP_FISHED },


the term "no_checking" replaced "proportion_check"