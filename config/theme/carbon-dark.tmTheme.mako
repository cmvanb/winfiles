<% from theme import color_hash %>\
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>name</key>
        <string>Carbon Dark</string>
        <key>colorSpaceName</key>
        <string>sRGB</string>
        <key>settings</key>
        <array>
            <!--
                Generic
            -->
            <dict>
                <key>settings</key>
                <dict>
                    <key>background</key>
                    <string>${color_hash("editor_bg")}</string>
                    <key>caret</key>
                    <string>${color_hash("text_0")}</string>
                    <key>foreground</key>
                    <string>${color_hash("secondary_9")}</string>
                    <key>invisibles</key>
                    <string>${color_hash("debug")}</string>
                    <key>lineHighlight</key>
                    <string>${color_hash("primary_6")}</string>
                    <key>selection</key>
                    <string>${color_hash("primary_15")}</string>
                    <key>gutterForeground</key>
                    <string>${color_hash("primary_8")}</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Text Base Colors</string>
                <key>scope</key>
                <string>none, text</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("terminal_text")}</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Source Base Colors</string>
                <key>scope</key>
                <string>source</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("secondary_9")}</string>
                </dict>
            </dict>
            <!--
                Identifier
            -->
            <dict>
                <key>name</key>
                <string>Parameters</string>
                <key>scope</key>
                <string>meta.parameters, variable.parameter</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("secondary_9")}</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Variables</string>
                <!--
                    NOTE: Highlights `self` in python.
                -->
                <key>scope</key>
                <string>support.variable, variable.language</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("secondary_9")}</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Bash Variables</string>
                <key>scope</key>
                <string>variable.other.readwrite.shell</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("secondary_9")}</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Keys</string>
                <key>scope</key>
                <string>string.unquoted.key</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("secondary_9")}</string>
                </dict>
            </dict>
            <!--
                Comments
            -->
            <dict>
                <key>name</key>
                <string>Comments</string>
                <key>scope</key>
                <string>comment, comment text, markup.strikethrough, punctuation.definition.comment, punctuation.whitespace.comment, string.comment, text.cancelled</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("text_8")}</string>
                    <key>fontStyle</key>
                    <string>italic</string>
                </dict>
            </dict>
            <!--
                Type
            -->
            <dict>
                <key>name</key>
                <string>Types</string>
                <key>scope</key>
                <string>storage.type, entity.name, entity.other.inherited-class, support.type, meta.tag.sgml.doctype.xml</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("secondary_12")}</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Attributes</string>
                <key>scope</key>
                <string>entity.other.attribute-name</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("secondary_12")}</string>
                </dict>
            </dict>
            <!--
                Constants
            -->
            <dict>
                <key>name</key>
                <string>Constants</string>
                <key>scope</key>
                <string>constant.language, variable.other.constant, punctuation.definition.constant</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("magenta_5")}</string>
                </dict>
            </dict>
            <!--
                Special
            -->
            <dict>
                <key>name</key>
                <string>Special</string>
                <key>scope</key>
                <string>support, support.function, support.other, support.module, meta.preprocessor, keyword.control.import, variable.annotation, punctuation.definition.annotation, constant.character.escape, entity.name.tag</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("yellow_5")}</string>
                    <key>fontStyle</key>
                    <string>bold</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Bash Special</string>
                <key>scope</key>
                <string>keyword.control.flow.exit.shell, keyword.operator.quantifier.regexp, comment.line.shebang.shell, comment.line.shebang.shell punctuation.definition.comment.shell, constant.language.shebang.shell, punctuation.definition.parameter.shell, variable.parameter.option.shell</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("yellow_5")}</string>
                    <key>fontStyle</key>
                    <string>bold</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>XML Special</string>
                <key>scope</key>
                <string>keyword.declaration.doctype.xml</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("yellow_5")}</string>
                    <key>fontStyle</key>
                    <string>bold</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Python Special</string>
                <key>scope</key>
                <string>support.type.python</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("yellow_5")}</string>
                    <key>fontStyle</key>
                    <string>bold</string>
                </dict>
            </dict>
            <!--
                Delimiter
            -->
            <dict>
                <key>name</key>
                <string>Punctuation</string>
                <key>scope</key>
                <string>punctuation, punctuation.definition.tag</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("green_4")}</string>
                </dict>
            </dict>
            <!--
                String
            -->
            <dict>
                <key>name</key>
                <string>Strings</string>
                <key>scope</key>
                <string>string, string.quoted, meta.object-literal.key string, punctuation.definition.string, storage.type.string.python</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("orange_6")}</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>String Templates</string>
                <key>scope</key>
                <key>settings</key>
                <string>constant.other.format-spec, constant.other.placeholder, punctuation.definition.string.template, punctuation.definition.template-expression, punctuation.quasi, punctuation.section.embedded, punctuation.section.interpolation, string.interpolated</string>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("yellow_5")}</string>
                </dict>
            </dict>
            <!--
                Keyword
            -->
            <dict>
                <key>name</key>
                <string>Keywords</string>
                <key>scope</key>
                <string>keyword, keyword.control, keyword.declaration.function</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("green_4")}</string>
                    <key>fontStyle</key>
                    <string>bold</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Type Qualifier</string>
                <key>scope</key>
                <string>storage.modifier, storage.type.struct, storage.type.function, storage.type.impl</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("green_4")}</string>
                    <key>fontStyle</key>
                    <string>bold</string>
                </dict>
            </dict>
            <!--
                Operator
            -->
            <dict>
                <key>name</key>
                <string>Operators</string>
                <key>scope</key>
                <string>punctuation.operator, punctuation.definition.variable, keyword.control.new, keyword.control.operator, keyword.operator, keyword.other.arrow, keyword.other.double-colon</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("green_4")}</string>
                </dict>
            </dict>
            <dict>
                <key>name</key>
                <string>Bash Brackets, Bash File Descriptor</string>
                <key>scope</key>
                <string>support.function.test.begin.shell, support.function.test.end.shell, meta.file-descriptor.shell constant.numeric</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("green_4")}</string>
                </dict>
            </dict>
            <!--
                Function
            -->
            <dict>
                <key>name</key>
                <string>Function Calls</string>
                <key>scope</key>
                <string>entity.name.function, declaration.function, meta.constructor, variable.function</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("secondary_15")}</string>
                    <key>fontStyle</key>
                    <string>bold</string>
                </dict>
            </dict>
            <!--
                Number
            -->
            <dict>
                <key>name</key>
                <string>Numbers</string>
                <key>scope</key>
                <string>constant.numeric</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("red_6")}</string>
                </dict>
            </dict>
            <!--
                Boolean
            -->
            <dict>
                <key>name</key>
                <string>Numbers</string>
                <key>scope</key>
                <string>constant.language.boolean</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("red_5")}</string>
                </dict>
            </dict>
            <!--
                Errors
            -->
            <dict>
                <key>name</key>
                <string>Invalids, Illegals and Errors</string>
                <key>scope</key>
                <string>invalid, message.error</string>
                <key>settings</key>
                <dict>
                    <key>foreground</key>
                    <string>${color_hash("debug")}</string>
                </dict>
            </dict>
        </array>
    </dict>
</plist>