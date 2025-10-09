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

; ============ 鼠标控制（WASD） ============ 
; 按下 Alt + W/A/S/D 控制鼠标移动方向
; 支持加速，松开键停止

; 参数可调
baseSpeed := 5          ; 初始速度
acceleration := 10      ; 每次循环速度增加
sleepTime := 10         ; 循环间隔（毫秒）

; ↑ W - 向上
!w::
speed := baseSpeed
Loop {
  if !GetKeyState("w", "P")
    break
  MouseMove, 0, -speed, 0, R
  Sleep, %sleepTime%
  speed += acceleration
}
return

; ↓ S - 向下
!s::
speed := baseSpeed
Loop {
  if !GetKeyState("s", "P")
    break
  MouseMove, 0, speed, 0, R
  Sleep, %sleepTime%
  speed += acceleration
}
return

; ← A - 向左
!a::
speed := baseSpeed
Loop {
  if !GetKeyState("a", "P")
    break
  MouseMove, -speed, 0, 0, R
  Sleep, %sleepTime%
  speed += acceleration
}
return

; → D - 向右
!d::
speed := baseSpeed
Loop {
  if !GetKeyState("d", "P")
    break
  MouseMove, speed, 0, 0, R
  Sleep, %sleepTime%
  speed += acceleration
}
return
