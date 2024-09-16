# WWE Documentation
## Batch OS / UI Window Manager by @sambubo16. Documentation.
WWE is an `Batch OS` Window Manager, originally was used in MingliumOS and was converted to VT-100.
WWE is also can be used for making a little GUI with Pure Batch.
To create a blue box on 5 X, 5 Y, 10 width and 10 height we need to type command:

```bat
echo=%\e%[48;5;27m
call wwe 5 5 10 10
```

Syntax of `WWE`:

```bat
REM Set colors by ANSI Escape codes or RGB...
echo=%\e%[48;5;27m
REM Create window
call wwe X Y Width Height
```
![image](https://github.com/user-attachments/assets/a84082f9-9fae-4799-9ecd-3dd8de22a3c5)
![image](https://github.com/user-attachments/assets/27e272c6-5d61-4d25-b373-084d8e6708f6)

