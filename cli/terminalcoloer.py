from colored import fg, bg, attr

print("enter [fg 'or'bg])\n")
color = input("Enter a stage: ")
print(
    "enter [1=boald, 2=dim, 4=underlie, 5=blink, 7=reverse, 8=hidden ,21=res_bold, 22=res_dim, 24=res_underline, 25=res_blink, 27=res_revese, 28=res_hidden]\n" 
)
attribute = int(input("Enter an attribute: "))

for i in range(0, 256):
    if color == "fg":
        # printal all colors with text "Hello World" and number of color with attr("")
        print(fg(i) + str(i) + attr(attribute), end=" ")
    elif color == "bg":
        print(bg(i) + str(i) + attr(attribute), end=" ")
    else:
        print("Error")
