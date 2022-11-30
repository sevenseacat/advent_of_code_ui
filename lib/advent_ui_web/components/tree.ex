defmodule AdventUIWeb.Components.Tree do
  use Phoenix.Component

  def tree(assigns) do
    ~H"""
    <pre class="mt-5 leading-snug" alt="Christmas tree">
    <%= for char <- String.graphemes(undecorated_tree()) do %><.char char={char} /><% end %>
    </pre>
    """
  end

  defp char(assigns) do
    ~H"<span class={classes(@char)}><%= @char %></span>"
  end

  defp classes(char) do
    case char do
      "*" -> "text-yellow-200 text-shadow shadow-yellow-200"
      "o" -> "text-orange-400 text-shadow shadow-orange-400"
      "O" -> "text-blue-500 text-shadow shadow-blue-500"
      "@" -> "text-red-500 text-shadow shadow-red-500"
      char when char in ["<", ">"] -> "text-green-600"
      _ -> "text-gray-500"
    end
  end

  def undecorated_tree() do
    """
                            |
                           \\|/
                          --*--
                           >o<
                          >>@<<
                         >>o<<<<
                        >>o>*<@<<
                       >*<<O>>>*<<
                      >>@>O<<*>>*<<
                     >@>>O<o<O<<<O<<
                    >@<<*<<O>>o<<@<<<
                   >O<*<<@<O>>@<<<O<<<
                  >>*<<<*<O<<<o<<@>>>o<
                 >*>>o>o>o>>o<@<<O>>>@<<
                >>@<<O>>>@<<<*<o>>*<<@>O<
               >>O<<@<<<o>>>O>>>O<<<*<<O<<
              >>o>*<<O<<<o<o>>@>*<@<<<o<@<<
             >@>>>o<<@>>O>>>*<<@<o>>>*<<o>o<
            >>O<o<<o<<<O<<<@>>o>>O>*>>>O>>*<<
           >@<<<*<o<o<<@<<<*<<<o<<<o>*<<<@>*<<
          >>O<o>O>*<<<*<*<@<<o<<o<<O>>@<@<<<o<<
         >>*<<O>*>>o>>>O<o<<<*<<@>>@<<<o>>O<<o<<
        >>@>O<O>*<<<O<<<@>@<<*>>>O>>*>>@>o>>>@<<<
       >O<<*<*<<<o<<<@<<<o>>>O>*>>@>>O<<O>>o<<@<<<
      >o<<o<<O>o>*>>>*<<<@<@<o>>>*>>@>>>o<@<<@>>o<<
     >@<<<O>>>o>*<<<o>@<*>o>>*>o>*>O<<<*<<*>>>@<<O<<
    >*>>o<*<<@<<<@>*>*<<@<<<o<<<o<<<*<<<*<<<@<O>*<<<<
                          |   |
                          |   |
               _  _ __ ___|___|___ __ _  _

    """
  end
end
