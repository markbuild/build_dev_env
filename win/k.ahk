; Alt-h 映射为 left arrow
!h::Send, {Left}
return

; Alt-j 映射为 down arrow
!j::Send, {Down}
return

; Alt-k 映射为 up arrow
!k::Send, {Up}
return

; Alt-l 映射为 right arrow
!l::Send, {Right}
return

; Alt-u 映射为点击鼠标左键
!u::Click
return

; Alt-o 映射为点击鼠标右键
!o::Click, right
return

; Alt-i 映射为F12
!i::Send {F12}
return

; ============ 鼠标控制（WASD） ============ 
; 按下 Alt + W/A/S/D 控制鼠标移动方向
; 支持加速，松开键停止

; ↑ W - 向上
!w::
speed := 5
Loop {
  if !GetKeyState("w", "P")
    break
  MouseMove, 0, -speed, 0, R
  Sleep, 10
  speed += 10 ; 每次循环距离增加
}
return

; ↓ S - 向下
!s::
speed := 5
Loop {
  if !GetKeyState("s", "P")
    break
  MouseMove, 0, speed, 0, R
  Sleep, 10
  speed += 10
}
return

; ← A - 向左
!a::
speed := 5
Loop {
  if !GetKeyState("a", "P")
    break
  MouseMove, -speed, 0, 0, R
  Sleep, 10
  speed += 10
}
return

; → D - 向右
!d::
speed := 5
Loop {
  if !GetKeyState("d", "P")
    break
  MouseMove, speed, 0, 0, R
  Sleep, 10
  speed += 10
}
return
