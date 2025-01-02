<% from theme import color_hash %>\
{
    "name": "Custom Theme",

    /* User Interface
    --------------------------------------------------------------------------*/
    "colors": {
        /* Base */
        "focusBorder": "${color_hash('primary_6')}",
        "foreground": "${color_hash('text_12')}",
        "disabledForeground": "${color_hash('text_7')}",
        "widget.border": "${color_hash('primary_3')}",
        "selection.background": "${color_hash('primary_10')}40",
        "description.foreground": "${color_hash('debug')}",

        /* Title bar */
        "titleBar.activeBackground": "${color_hash('primary_3')}",

        /* Activity bar */
        "activityBar.background": "${color_hash('primary_3')}",
        "activityBar.foreground": "${color_hash('text_12')}",
        "activityBarBadge.background": "${color_hash('primary_12')}",

        /* Status bar */
        "statusBar.background": "${color_hash('primary_3')}",

        /* Side bar */
        "sideBar.background": "${color_hash('primary_2')}",
        "sideBar.foreground": "${color_hash('text_12')}",
        "sideBarTitle.foreground": "${color_hash('text_15')}",
        "sideBarTitle.background": "${color_hash('primary_2')}",
        "sideBarSectionHeader.background": "${color_hash('primary_3')}",
        "sideBarSectionHeader.foreground": "${color_hash('text_15')}",

        /* List (affects side bar) */
        "list.activeSelectionBackground": "${color_hash('primary_6')}",
        "list.activeSelectionForeground": "${color_hash('text_15')}",
        "list.inactiveSelectionBackground": "${color_hash('primary_4')}",
        "list.inactiveSelectionForeground": "${color_hash('text_12')}",
        "list.highlightForeground": "${color_hash('debug')}",
        "list.hoverBackground": "${color_hash('text_2')}",

        /* Editor groups */
        "editorGroup.border": "${color_hash('primary_2')}",
        "editorGroup.emptyBackground": "${color_hash('primary_2')}",
        "editorGroupHeader.tabsBackground": "${color_hash('primary_2')}",
        "editorGroupHeader.tabsBorder": "${color_hash('primary_3')}",

        /* Tabs */
        "tab.activeBackground": "${color_hash('primary_6')}",
        "tab.activeForeground": "${color_hash('text_15')}",
        "tab.inactiveBackground": "${color_hash('primary_3')}",
        "tab.inactiveForeground": "${color_hash('text_10')}",
        "tab.border": "${color_hash('primary_2')}",

        /* Breadcrumb */
        "breadcrumb.background": "${color_hash('primary_3')}",
        "breadcrumb.foreground": "${color_hash('text_10')}",
        "breadcrumb.focusForeground": "${color_hash('text_15')}",

        /* Panel (e.g. integrated terminal) */
        "panel.background": "${color_hash('primary_3')}",
        "panel.border": "${color_hash('primary_4')}",

        /* Dropdown widget */
        "dropdown.background": "${color_hash('primary_4')}",
        "dropdown.listBackground": "${color_hash('primary_4')}",
        "dropdown.border": "${color_hash('primary_3')}",
        "dropdown.foreground": "${color_hash('text_12')}",

        /* Input widget */
        "input.background": "${color_hash('primary_2')}",
        "input.foreground": "${color_hash('text_12')}",
        "input.border": "${color_hash('primary_4')}",
        "input.placeholderForeground": "${color_hash('text_8')}",
        "inputOption.activeBackground": "${color_hash('primary_10')}80",
        "inputOption.activeForeground": "${color_hash('text_15')}",
        "inputOption.activeBorder": "${color_hash('primary_10')}",
        "inputOption.hoverBackground": "${color_hash('primary_6')}80",
        "inputValidation.errorBackground": "${color_hash('red_1')}",
        "inputValidation.errorForeground": "${color_hash('red_6')}",
        "inputValidation.errorBorder": "${color_hash('red_6')}",
        "inputValidation.warningBackground": "${color_hash('orange_3')}",
        "inputValidation.warningForeground": "${color_hash('yellow_6')}",
        "inputValidation.warningBorder": "${color_hash('yellow_6')}",
        "inputValidation.infoBackground": "${color_hash('gray_5')}",
        "inputValidation.infoForeground": "${color_hash('gray_15')}",
        "inputValidation.infoBorder": "${color_hash('gray_15')}",

        /* Quick input widget (e.g. command palette) */
        "quickInput.background": "${color_hash('primary_4')}",
        "quickInput.foreground": "${color_hash('text_12')}",

        /* Buttons */
        "button.background": "${color_hash('primary_6')}",
        "button.foreground": "${color_hash('text_15')}",
        "button.hoverBackground": "${color_hash('primary_10')}",

        /* Text */
        "textLink.activeForeground": "${color_hash('yellow_6')}",
        "textLink.foreground": "${color_hash('primary_15')}",

        /* Terminal */
        "terminal.background": "${color_hash('terminal_bg')}",
        "terminal.foreground": "${color_hash('terminal_text')}",
        "terminal.ansiBlack": "${color_hash('ansi_black')}",
        "terminal.ansiRed": "${color_hash('ansi_red')}",
        "terminal.ansiGreen": "${color_hash('ansi_green')}",
        "terminal.ansiYellow": "${color_hash('ansi_yellow')}",
        "terminal.ansiBlue": "${color_hash('ansi_blue')}",
        "terminal.ansiMagenta": "${color_hash('ansi_magenta')}",
        "terminal.ansiCyan": "${color_hash('ansi_cyan')}",
        "terminal.ansiWhite": "${color_hash('ansi_white')}",
        "terminal.ansiBrightBlack": "${color_hash('ansi_brblack')}",
        "terminal.ansiBrightRed": "${color_hash('ansi_brred')}",
        "terminal.ansiBrightGreen": "${color_hash('ansi_brgreen')}",
        "terminal.ansiBrightYellow": "${color_hash('ansi_bryellow')}",
        "terminal.ansiBrightBlue": "${color_hash('ansi_brblue')}",
        "terminal.ansiBrightMagenta": "${color_hash('ansi_brmagenta')}",
        "terminal.ansiBrightCyan": "${color_hash('ansi_brcyan')}",
        "terminal.ansiBrightWhite": "${color_hash('ansi_brwhite')}",

        /* Editor */
        "editor.background": "${color_hash('editor_bg')}",
        "editor.foreground": "${color_hash('editor_text_normal')}",
        "editorCursor.background": "${color_hash('gray_0')}",
        "editorCursor.foreground": "${color_hash('text_15')}",
        "editor.lineHighlightBackground": "${color_hash('primary_2')}",
        "editor.rangeHighlightBackground": "${color_hash('debug')}",
        "editor.selectionBackground": "${color_hash('primary_10')}60",
        "editor.selectionForeground": "${color_hash('gray_0')}",
        "editor.findMatchBackground": "${color_hash('magenta_5')}",

        /* Editor diagnostics */
        "editorError.foreground": "${color_hash('red_5')}",
        "editorWarning.foreground": "${color_hash('yellow_5')}",
        "editorInfo.foreground": "${color_hash('text_10')}",
        "editorHint.foreground": "${color_hash('orange_7')}",

        /* Editor guttter */
        "editorGutter.background": "${color_hash('editor_bg')}",
        "editorGutter.addedBackground": "${color_hash('green_3')}",
        "editorGutter.modifiedBackground": "${color_hash('orange_3')}",
        "editorGutter.deletedBackground": "${color_hash('red_3')}",

        /* Minimap */
        "minimap.background": "${color_hash('primary_2')}",
        "minimap.findMatchHighlight": "${color_hash('magenta_5')}80",
        "minimap.selectionOccurrenceHighlight": "${color_hash('text_10')}80",
        "minimap.errorHighlight": "${color_hash('red_5')}80",
        "minimap.warningHighlight": "${color_hash('yellow_5')}80",
        "minimap.infoHighlight": "${color_hash('text_10')}80",
        "minimap.foregroundOpacity": "#000000c0",
        "minimapSlider.background": "${color_hash('primary_6')}40",
        "minimapSlider.hoverBackground": "${color_hash('primary_6')}40",
        "minimapSlider.activeBackground": "${color_hash('primary_10')}60",

        /* Scrollbar */
        "editorOverviewRuler.background": "${color_hash('primary_2')}",
        "scrollbar.shadow": "${color_hash('gray_0')}40",
        "scrollbarSlider.background": "${color_hash('primary_6')}40",
        "scrollbarSlider.hoverBackground": "${color_hash('primary_6')}40",
        "scrollbarSlider.activeBackground": "${color_hash('primary_10')}60",
    },

    /* Syntax
    --------------------------------------------------------------------------*/
    "tokenColors": [
        {
            "name": "Comment",
            "scope": [
                "comment",
                "punctuation.definition.comment"
            ],
            "settings": {
                "fontStyle": "italic",
                "foreground": "${color_hash('text_6')}"
            }
        },
        {
            "name": "Variables",
            "scope": [
                "variable",
                "string constant.other.placeholder"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_9')}"
            }
        },
        {
            "name": "Colors",
            "scope": [
                "constant.other.color"
            ],
            "settings": {
                "foreground": "#ffffff"
            }
        },
        {
            "name": "Invalid",
            "scope": [
                "invalid",
                "invalid.illegal"
            ],
            "settings": {
                "foreground": "${color_hash('red_5')}"
            }
        },
        {
            "name": "Keyword, Storage",
            "scope": [
                "keyword",
                "storage.type",
                "storage.modifier"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('green_4')}"
            }
        },
        {
            "name": "Operator, Misc",
            "scope": [
                "keyword.control",
                "constant.other.color",
                "punctuation",
                "meta.tag",
                "punctuation.definition.tag",
                "punctuation.separator.inheritance.php",
                "punctuation.definition.tag.html",
                "punctuation.definition.tag.begin.html",
                "punctuation.definition.tag.end.html",
                "punctuation.section.embedded",
                "keyword.other.template",
                "keyword.other.substitution"
            ],
            "settings": {
                "foreground": "${color_hash('green_4')}"
            }
        },
        /* Tag (e.g. YAML keys) */
        {
            "name": "Tag",
            "scope": [
                "entity.name.tag",
                "meta.tag.sgml",
                "markup.deleted.git_gutter"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "Function, Special Method",
            "scope": [
                "entity.name.function",
                "meta.function-call",
                "variable.function",
                "support.function",
                "keyword.other.special-method"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('secondary_15')}"
            }
        },
        {
            "name": "Block Level Variables",
            "scope": [
                "meta.block variable.other"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_9')}"
            }
        },
        {
            "name": "Other Variable, String Link",
            "scope": [
                "support.other.variable",
                "string.other.link"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('yellow_5')}"
            }
        },
        {
            "name": "Number, Constant, Function Argument, Tag Attribute, Embedded",
            "scope": [
                "constant.numeric",
                "constant.language",
                "support.constant",
                "constant.character",
                "constant.escape",
                "variable.parameter",
                "keyword.other.unit",
                "keyword.other"
            ],
            "settings": {
                "foreground": "${color_hash('red_6')}"
            }
        },
        {
            "name": "String, Symbols, Inherited Class, Markup Heading",
            "scope": [
                "string",
                "constant.other.symbol",
                "constant.other.key",
                "entity.other.inherited-class",
                "markup.heading",
                "markup.inserted.git_gutter",
                "meta.group.braces.curly constant.other.object.key.js string.unquoted.label.js"
            ],
            "settings": {
                "foreground": "${color_hash('orange_6')}"
            }
        },
        {
            "name": "Class, Support",
            "scope": [
                "entity.name",
                "support.type",
                "support.class",
                "support.other.namespace.use.php",
                "meta.use.php",
                "support.other.namespace.php",
                "markup.changed.git_gutter",
                "support.type.sys-types"
            ],
            "settings": {
                "foreground": "${color_hash('magenta_5')}"
            }
        },
        {
            "name": "Entity Types",
            "scope": [
                "support.type"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "CSS Class and Support",
            "scope": [
                "source.css support.type.property-name",
                "source.sass support.type.property-name",
                "source.scss support.type.property-name",
                "source.less support.type.property-name",
                "source.stylus support.type.property-name",
                "source.postcss support.type.property-name"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Sub-methods",
            "scope": [
                "entity.name.module.js",
                "variable.import.parameter.js",
                "variable.other.class.js"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_9')}"
            }
        },
        {
            "name": "Language methods",
            "scope": [
                "variable.language"
            ],
            "settings": {
                "fontStyle": "italic",
                "foreground": "${color_hash('secondary_9')}"
            }
        },
        {
            "name": "entity.name.method.js",
            "scope": [
                "entity.name.method.js"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "meta.method.js",
            "scope": [
                "meta.class-method.js entity.name.function.js",
                "variable.function.constructor"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_15')}"
            }
        },
        {
            "name": "Attributes",
            "scope": [
                "entity.other.attribute-name"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "HTML Attributes",
            "scope": [
                "text.html.basic entity.other.attribute-name.html",
                "text.html.basic entity.other.attribute-name"
            ],
            "settings": {
                "fontStyle": "italic",
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "CSS Classes",
            "scope": [
                "entity.other.attribute-name.class"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_15')}"
            }
        },
        {
            "name": "CSS ID's",
            "scope": [
                "source.sass keyword.control"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('yellow_5')}"
            }
        },
        {
            "name": "Inserted",
            "scope": [
                "markup.inserted"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Deleted",
            "scope": [
                "markup.deleted"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Changed",
            "scope": [
                "markup.changed"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Regular Expressions",
            "scope": [
                "string.regexp"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('yellow_5')}"
            }
        },
        {
            "name": "Escape Characters",
            "scope": [
                "constant.character.escape"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('yellow_5')}"
            }
        },
        {
            "name": "URL",
            "scope": [
                "*url*",
                "*link*",
                "*uri*"
            ],
            "settings": {
                "fontStyle": "underline"
            }
        },
        {
            "name": "Decorators",
            "scope": [
                "tag.decorator.js entity.name.tag.js",
                "tag.decorator.js punctuation.definition.tag.js"
            ],
            "settings": {
                "fontStyle": "italic",
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "ES7 Bind Operator",
            "scope": [
                "source.js constant.other.object.key.js string.unquoted.label.js"
            ],
            "settings": {
                "fontStyle": "italic",
                "foreground": "${color_hash('green_4')}"
            }
        },
        {
            "name": "JSON Key - Level 0",
            "scope": [
                "source.json meta.structure.dictionary.json support.type.property-name.json"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "JSON Key - Level 1",
            "scope": [
                "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "JSON Key - Level 2",
            "scope": [
                "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "JSON Key - Level 3",
            "scope": [
                "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "JSON Key - Level 4",
            "scope": [
                "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "JSON Key - Level 5",
            "scope": [
                "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "JSON Key - Level 6",
            "scope": [
                "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "JSON Key - Level 7",
            "scope": [
                "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "JSON Key - Level 8",
            "scope": [
                "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_12')}"
            }
        },
        {
            "name": "Markdown - Plain",
            "scope": [
                "text.html.markdown",
                "punctuation.definition.list_item.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('secondary_9')}"
            }
        },
        {
            "name": "Markdown - Markup Raw Inline",
            "scope": [
                "text.html.markdown markup.inline.raw.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Markup Raw Inline Punctuation",
            "scope": [
                "text.html.markdown markup.inline.raw.markdown punctuation.definition.raw.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Heading",
            "scope": [
                "markdown.heading",
                "markup.heading | markup.heading entity.name",
                "markup.heading.markdown punctuation.definition.heading.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('text_15')}"
            }
        },
        {
            "name": "Markup - Italic",
            "scope": [
                "markup.italic"
            ],
            "settings": {
                "fontStyle": "italic",
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markup - Bold",
            "scope": [
                "markup.bold",
                "markup.bold string"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markup - Bold-Italic",
            "scope": [
                "markup.bold markup.italic",
                "markup.italic markup.bold",
                "markup.quote markup.bold",
                "markup.bold markup.italic string",
                "markup.italic markup.bold string",
                "markup.quote markup.bold string"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markup - Underline",
            "scope": [
                "markup.underline"
            ],
            "settings": {
                "fontStyle": "underline",
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Blockquote",
            "scope": [
                "markup.quote punctuation.definition.blockquote.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markup - Quote",
            "scope": [
                "markup.quote"
            ],
            "settings": {
                "fontStyle": "italic"
            }
        },
        {
            "name": "Markdown - Link",
            "scope": [
                "string.other.link.title.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Link Description",
            "scope": [
                "string.other.link.description.title.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Link Anchor",
            "scope": [
                "constant.other.reference.link.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markup - Raw Block",
            "scope": [
                "markup.raw.block"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Raw Block Fenced",
            "scope": [
                "markup.raw.block.fenced.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Fenced Bode Block",
            "scope": [
                "punctuation.definition.fenced.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Fenced Bode Block Variable",
            "scope": [
                "markup.raw.block.fenced.markdown",
                "variable.language.fenced.markdown",
                "punctuation.section.class.end"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Fenced Language",
            "scope": [
                "variable.language.fenced.markdown"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markdown - Separator",
            "scope": [
                "meta.separator"
            ],
            "settings": {
                "fontStyle": "bold",
                "foreground": "${color_hash('debug')}"
            }
        },
        {
            "name": "Markup - Table",
            "scope": [
                "markup.table"
            ],
            "settings": {
                "foreground": "${color_hash('debug')}"
            }
        }
    ]
}