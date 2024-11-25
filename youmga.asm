################# CSC258 Assembly Final Project ###################
# This file contains our implementation of Dr Mario.
#
# Student 1: Cynthia Liu, 1010243675
# Student 2: Tianyi Mao, 1010627092
#
# We assert that the code submitted here is entirely our own 
# creation, and will indicate otherwise when it is not.
#
######################## Bitmap Display Configuration ########################
# - Unit width in pixels:       2
# - Unit height in pixels:      2
# - Display width in pixels:    64
# - Display height in pixels:   64
# - Base Address for Display:   0x10008000 ($gp)
##############################################################################

    .data
##############################################################################
# Immutable Data
##############################################################################
# The address of the bitmap display. Don't forget to connect it!
ADDR_DSPL:
    .word 0x10008000
# The address of the keyboard. Don't forget to connect it!
ADDR_KBRD:
    .word 0xffff0000

# Define colors for the capsule
COLOR_RED:
    .word 0xff0000
COLOR_BLUE:
    .word 0x0000ff
COLOR_GREEN:  
    .word 0x0000FF00
    
# Define the color for the bottle boundaries (gray)
COLOR_GRAY:
    .word 0x808080

# Seed for random number generation
seed:            
    .word 12345678

# 显示相关
bitmap_base:      
    .word 0x10008000  
display_width:    
    .word 64        
display_height:   
    .word 32 
    
    
##############################################################################
# Music
##############################################################################
music_data:
    .word 70, 21, 1           
    .word 0, 2, 1           
    .word 71, 2, 1           
    .word 0, 2, 1           

    .word 70, 2, 1           
    .word 0, 2, 1           
    .word 71, 2, 1           
    .word 0, 2, 1           

    .word 69, 2, 1           
    .word 0, 2, 1           
    .word 67, 2, 1           
    .word 0, 2, 1           

    .word 67, 2, 1           
    .word 0, 2, 1           
    .word 69, 2, 1           
    .word 0, 2, 1           

##############################################

    .word 70, 2, 1           
    .word 0, 2, 1           
    .word 71, 2, 1           
    .word 0, 2, 1           

    .word 69, 2, 1           
    .word 0, 2, 1           
    .word 67, 2, 1           
    .word 0, 2, 1           

    .word 67, 2, 1           
    .word 0, 2, 1           
    .word 0, 2, 1           
    .word 0, 2, 1           
    .word 0, 2, 1           
    .word 0, 2, 1           
    .word 0, 2, 1           
    .word 0, 2, 1           

##############################################

    .word 70, 2, 1           
    .word 0, 2, 1           
    .word 71, 2, 1           
    .word 0, 2, 1           

    .word 70, 2, 1           
    .word 0, 2, 1           
    .word 71, 2, 1           
    .word 0, 2, 1           

    .word 69, 2, 1           
    .word 0, 2, 1           
    .word 67, 2, 1           
    .word 0, 2, 1           

    .word 67, 2, 1           
    .word 0, 2, 1           
    .word 69, 2, 1           
    .word 0, 2, 1           
    
##############################################

    .word 67, 2, 0 , 71, 2, 1
    .word 67, 2, 0 , 71, 2, 1
    .word 67, 2, 0 , 71, 2, 1
    .word 0, 2, 1

    .word 67, 2, 0 , 69, 2, 0, 72, 2, 1
    .word 67, 2, 0 , 69, 2, 0, 72, 2, 1
    .word 67, 2, 0 , 69, 2, 0, 72, 2, 1
    .word 0, 2, 1

    .word 67, 2, 0 , 70, 2, 0, 73, 2, 1
    .word 67, 2, 0 , 70, 2, 0, 73, 2, 1
    .word 67, 2, 0 , 70, 2, 0, 73, 2, 1
    .word 0, 2, 1

    .word 67, 2, 0 , 71, 2, 0, 74, 2, 1
    .word 67, 2, 0 , 71, 2, 0, 74, 2, 1
    .word 67, 2, 0 , 71, 2, 0, 74, 2, 1
    .word 0, 2, 1

##############################################

    .word 70, 21, 1           
    .word 0, 2, 1           
    .word 71, 2, 1           
    .word 0, 2, 1           

    .word 70, 2, 1           
    .word 0, 2, 1           
    .word 71, 2, 1           
    .word 0, 2, 1           

    .word 69, 2, 1           
    .word 0, 2, 1           
    .word 67, 2, 1           
    .word 0, 2, 1           

    .word 67, 2, 1           
    .word 0, 2, 1           
    .word 69, 2, 1           
    .word 0, 2, 1           

##############################################

    .word 70, 2, 1        
    .word 0, 2, 1        
    .word 71, 2, 1        
    .word 0, 2, 1        

    .word 69, 2, 1        
    .word 0, 2, 1        
    .word 67, 2, 1        
    .word 0, 2, 1        

    .word 67, 2, 1        
    .word 0, 2, 1        
    .word 0, 2, 1        
    .word 0, 2, 1        
    .word 0, 2, 1        
    .word 0, 2, 1        
    .word 0, 2, 1        
    .word 0, 2, 1        

##############################################

    .word 70, 2, 1           
    .word 0, 2, 1           
    .word 71, 2, 1           
    .word 0, 2, 1           

    .word 70, 2, 1           
    .word 0, 2, 1           
    .word 71, 2, 1           
    .word 0, 2, 1           

    .word 69, 2, 1           
    .word 0, 2, 1           
    .word 67, 2, 1           
    .word 0, 2, 1           

    .word 67, 2, 1           
    .word 0, 2, 1           
    .word 69, 2, 1           
    .word 0, 2, 1           

##############################################

    .word 86, 2, 1 
    .word 80, 2, 1
    .word 76, 2, 1
    .word 75, 2, 1

    .word 80, 2, 1
    .word 75, 2, 1
    .word 74, 2, 1
    .word 68, 2, 1

    .word 65, 2, 1
    .word 70, 2, 1
    .word 66, 2, 1
    .word 62, 2, 1

    .word 63, 2, 1
    .word 61, 2, 1
    .word 59, 2, 1
    .word 58, 2, 1

##############################################

    .word 75, 2, 0, 65, 2, 1
    .word 0, 2, 1
    .word 76, 2, 0, 65, 2, 1
    .word 0, 2, 1

    .word 75, 2, 0, 65, 2, 1
    .word 0, 2, 1
    .word 76, 2, 0, 65, 2, 1
    .word 0, 2, 1

    .word 74, 2, 0, 64, 2, 1
    .word 0, 2, 1
    .word 72, 2, 0, 68, 2, 1
    .word 0, 2, 1
    
    .word 72, 2, 0, 68, 2, 1
    .word 0, 2, 1
    .word 67, 2, 0, 64, 2, 1
    .word 0, 2, 1

    .word 75, 2, 0, 65, 2, 1
    .word 0, 2, 1
    .word 76, 2, 0, 65, 2, 1
    .word 0, 2, 1

    .word 74, 2, 0, 65, 2, 1
    .word 0, 2, 1
    .word 72, 2, 0, 65, 2, 1
    .word 0, 2, 1

    .word 72, 2, 0, 67, 2, 0, 64, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1

##############################################

    .word 75, 2, 0, 65, 2, 1
    .word 0, 2, 1
    .word 76, 2, 0, 65, 2, 1
    .word 0, 2, 1

    .word 75, 2, 0, 65, 2, 1
    .word 0, 2, 1
    .word 76, 2, 0, 65, 2, 1
    .word 0, 2, 1

    .word 74, 2, 0, 64, 2, 1
    .word 0, 2, 1
    .word 72, 2, 0, 68, 2, 1
    .word 0, 2, 1
    .word 72, 2, 0, 68, 2, 1
    .word 0, 2, 1
    .word 67, 2, 0, 64, 2, 1
    .word 0, 2, 1

    .word 76, 2, 0, 67, 2, 1
    .word 0, 2, 1
    .word 67, 2, 0, 60, 2, 1
    .word 0, 2, 1
    .word 69, 2, 0, 63, 2, 1
    .word 0, 2, 1
    .word 74, 2, 0, 64, 2, 1
    .word 0, 2, 1
    .word 72, 2, 0, 65, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1
    .word 69, 2, 0, 64, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1
    .word 0, 2, 1
    .word 1000, 1000

##############################################################################
# Mutable Data
##############################################################################
game_running:     
    .word 1    
capsule_x:        
    .word 13   
capsule_y:        
    .word 2 
prev_x:           
    .word 0
prev_y:           
    .word 0    
capsule_rotation: 
    .word 0   
prev_rotation: 
    .word 0
capsule_color1:    
    .word 0
capsule_color2:    
    .word 0
   
# Music data
game_map:
    .space 4096
instrument: .word 28
volume: .word 50
music_duration_unit: .word 500
music_sleep_time: .word 500000
current_music_data: .word 0
##############################################################################
# Code
##############################################################################
	.text
	.globl main

main:
    
    # 初始化保存寄存器
    lw $s0, ADDR_KBRD           # $s0 = 键盘基地址
    lw $s1, bitmap_base         # $s1 = 位图基地址
    lw $s2, display_width       # $s2 = 显示宽度
    # 使用系统时间初始化随机计数器 $s3
    li $v0, 30                 # 系统调用：获取当前时间
    syscall
    move $s3, $a0              # 将时间值存入 $s3 作为种子

    jal init_colors             # 调用初始化颜色函数
    jal restart_music
    
# Milestone 1: Draw the scene
draw_screen:
 #  The medicine bottle
 # For debug
    addi $sp, $sp, -4       # Make space on stack
    sw $ra, 0($sp)          # Save $ra onto stack
    # Step 1: Draw the left boundary column
    jal draw_left_boundary

    # Step 2: Draw the first half of the top row (left side)
    jal draw_top_row_left

    # Step 3: Draw the neck (left neck)
    jal draw_left_neck

    # Step 4: Draw the neck (right neck)
    jal draw_right_neck

    # Step 5: Draw the second half of the top row (right side)
    jal draw_top_row_right

    # Step 6: Draw the right boundary column
    jal draw_right_boundary

    # Step 7: Draw the bottom row
    jal draw_bottom_row


    jal draw_capsule

    lw $ra, 0($sp)          # Restore $ra
    addi $sp, $sp, 4        # Restore stack pointer


# Milestone 2: Implement movement and other controls
# Milestone 3: Implement collision detection
main_loop:
    
    li $v0, 32              # Sleep syscall
    li $a0, 1               # Sleep for 1 millisecond
    syscall

    lw $t0, 0($s0)              # read the key status
    beq $t0, 1, keyboard_input  # if there is key pressed and then get into processor

    jal draw_screen
    
    jal check_can_play_music
    j main_loop

# game_loop:
    # # 1a. Check if key has been pressed
    # # 1b. Check which key has been pressed
    # # 2a. Check for collisions
	# # 2b. Update locations (capsules)
	# # 3. Draw the screen
	# # 4. Sleep
    # # 
    # # 5. Go back to Step 1
    # jal check_can_play_music
    # j game_loop

########################### Helper Functions for music###########################
restart_music:
    la $t0, music_data
    sw $t0, current_music_data
    jr $ra

check_can_play_music:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    la $t0, music_sleep_time
    lw $t1, 0($t0)
    addi $t1, $t1, -1
    sw $t1, 0($t0)

    bgtz $t1, back_to_loop_from_paly
    jal play_next_unit_music

back_to_loop_from_paly:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

play_next_unit_music:
    la $t0, current_music_data
    lw $t0, 0($t0)
    lw $a0, 0($t0)           # 读取音高 (pitch)
    beq $a0, 1000, restart_music # 如果音高为 0，表示结束，跳转重头开始
    la $t1, music_duration_unit
    lw $a1, 4($t0)           # 读取持续时间 (duration)
    mul $a1, $a1, $t1        # 持续时间乘以单位时间
    la $t1, instrument
    lw $a2, 0($t1)           # 读取音量 (volume)
    la $t1, volume
    lw $a3, 0($t1)           # 读取乐器 (instrument)

    # 播放当前音符
    li $v0, 31               # syscall 31 用于 MIDI 播放
    syscall

    addi $t1, $t0, 12        # 移动到下一个音符数据
    sw $t1, current_music_data # 存回去

    lw $a0, 8($t0)           # 读取是否有下一个连续音符 如果是1的话就延迟
    beq $a0, 1, delay        # 如果没有下一个音符，延迟一段时间

    jal back_to_loop_from_paly

delay:
    li,$t1, 25000         #记得修改这个 如果代码量少的话就需要大一点 代码多的的话就小一点
    sw $t1, music_sleep_time
    jal back_to_loop_from_paly
############################################################################################




    
keyboard_input:
    lw $a0, 4($s0)              # read key's ASCII

    li $t1, 'q'                     # ASCII code for 'q'
    beq $a0, $t1, quit_game         # If 'q' is pressed, quit game

    li $t1, 'w'                     # ASCII code for 'w'
    beq $a0, $t1, rotate_capsule

    li $t1, 'a'                     # ASCII code for 'a'
    beq $a0, $t1, move_left

    li $t1, 'd'                     # ASCII code for 'd'
    beq $a0, $t1, move_right

    li $t1, 's'                     # ASCII code for 's'
    beq $a0, $t1, move_down

    jr $ra

quit_game:
    li $v0, 10                      # Exit syscall
    syscall


move_left:
    lw $t0, capsule_x       # 加载 x 坐标
    lw $t2, capsule_rotation # 加载旋转状态

    # 检查移动限制
    beq $t2, $zero, check_vertical_left_limit  # 如果旋转 == 0，检查垂直边界
    li $t1, 0                                 # 如果旋转 == 1 (水平)，边界是 0
    ble $t0, $t1, skip_move                  # 如果 x <= 0，跳过移动
    j continue_move_left                     # 否则，继续移动
    
    # check the rotation station
    beq $t2, $zero, move_left_v
    beq $t2, 1, move_left_h
    
    
move_left_v:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal coord_to_address  # find the first pixel's coord
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    
    



move_left_h:




check_vertical_left_limit:
    li $t1, 3                                 
    ble $t0, $t1, skip_move                  # 如果 x <= 1，跳过移动
    j continue_move_left                     # 否则，继续移动    

continue_move_left:
    addi $sp, $sp, -4       # 保存寄存器 $v0
    sw $v0, 0($sp)

    # 更新 prev_x, prev_y, prev_rotation
    lw $t1, capsule_x       # 加载当前 x 坐标
    sw $t1, prev_x          # 保存当前 x 坐标到 prev_x
    lw $t0, capsule_y       # 加载当前 y 坐标
    sw $t0, prev_y          # 保存当前 y 坐标到 prev_y
    lw $t2, capsule_rotation # 加载当前旋转状态
    sw $t2, prev_rotation   # 保存当前旋转状态到 prev_rotation

    addi $sp, $sp, -4       # 保存寄存器 $a0
    sw $a0, 0($sp)
    addi $sp, $sp, -4       # 保存寄存器 $a1
    sw $a1, 0($sp)
    addi $sp, $sp, -4       # 保存寄存器 $ra
    sw $ra, 0($sp)

    # 调用 coord_to_address 获取胶囊的地址
    add $a0, $zero, $t1     # $a0 = capsule_x
    add $a1, $zero, $t0     # $a1 = capsule_y
    jal coord_to_address    # 获取当前像素地址

    lw $ra, 0($sp)          # 恢复 $ra
    addi $sp, $sp, 4
    lw $a1, 0($sp)          # 恢复 $a1
    addi $sp, $sp, 4
    lw $a0, 0($sp)          # 恢复 $a0
    addi $sp, $sp, 4

    # 更新显示
    lw $t3, 0($v0)          # 加载当前像素（上半部分）的颜色

    lw $t4, -4($v0)         # 加载前一个像素（左侧）的颜色
    sw $t3, -4($v0)         # 将上半部分的颜色移动到左侧像素
    sw $zero, 0($v0)        # 擦除原位置的上半部分颜色
    
    lw $t5, 128($v0)        # 加载下半部分颜色
    lw $t6, 124($v0)        # 加载下一个左侧像素的下半部分颜色
    sw $t5, 124($v0)        # 将当前下半部分颜色移动到左侧位置
    sw $zero, 128($v0)      # 擦除原下半部分颜色

    beq $t2, $zero, skip_horizontal_clean_left
    sw $t6, -8($v0)         # 如果水平旋转，将下半部分移动到新位置
    sw $zero, -4($v0)       # 擦除原水平位置
    j update_x_left

skip_horizontal_clean_left:
    sw $zero, -4($v0)       # 如果垂直旋转，清理水平像素

update_x_left:
    # 更新 capsule_x
    addi $t1, $t1, -1       # 减少 x 坐标
    sw $t1, capsule_x       # 保存新的 x 坐标到 capsule_x

    # 恢复 $v0 的值
    lw $v0, 0($sp)
    addi $sp, $sp, 4
    jr $ra                  # 返回调用点

    
    
skip_move:
    jr $ra


move_right:
    lw $t0, capsule_x   # load  x coordinate
    lw $t2, capsule_rotation # load rotation

    # Check movement limitation
    beq $t2, $zero, check_vertical_right_limit  # If rotate == 0, check vertical boundary
    li $t1, 3                             # If rotate == 1 (horizontal), boundary is 29
    bgt $t0, $t1, skip_move                # If x > 29, skip the move
    j continue_move_right                  # Otherwise, continue
    
check_vertical_right_limit:
    li $t1, 22                             
    bgt $t0, $t1, skip_move                # If x > 30, skip the move
    j continue_move_right                  # Otherwise, continue    
      
continue_move_right:
    addi $sp, $sp, -4       # 保存寄存器 $v0
    sw $v0, 0($sp)

    # 更新 prev_x, prev_y, prev_rotation
    lw $t1, capsule_x       # 加载当前 x 坐标
    sw $t1, prev_x          # 保存当前 x 坐标到 prev_x
    lw $t0, capsule_y       # 加载当前 y 坐标
    sw $t0, prev_y          # 保存当前 y 坐标到 prev_y
    lw $t2, capsule_rotation # 加载当前旋转状态
    sw $t2, prev_rotation   # 保存当前旋转状态到 prev_rotation

    addi $sp, $sp, -4       # 保存寄存器 $a0
    sw $a0, 0($sp)
    addi $sp, $sp, -4       # 保存寄存器 $a1
    sw $a1, 0($sp)
    addi $sp, $sp, -4       # 保存寄存器 $ra
    sw $ra, 0($sp)

    # 调用 coord_to_address 获取胶囊的地址
    add $a0, $zero, $t1     # $a0 = capsule_x
    add $a1, $zero, $t0     # $a1 = capsule_y
    jal coord_to_address    # 获取当前像素地址

    lw $ra, 0($sp)          # 恢复 $ra
    addi $sp, $sp, 4
    lw $a1, 0($sp)          # 恢复 $a1
    addi $sp, $sp, 4
    lw $a0, 0($sp)          # 恢复 $a0
    addi $sp, $sp, 4

    # 更新显示
    lw $t3, 0($v0)          # 加载当前像素（上半部分）的颜色

    lw $t4, 4($v0)          # 加载下一个像素（右侧）的颜色
    sw $t3, 4($v0)          # 将上半部分的颜色移动到右侧像素
    sw $zero, 0($v0)        # 擦除原位置的上半部分颜色
    
    lw $t5, 128($v0)        # load the lower color
    lw $t6, 132($v0)        # load the next color of lower color
    sw $zero, 128($v0)

    beq $t2, $zero, skip_horizontal_clean
    sw $t4, 8($v0)          # 如果水平旋转，将下半部分移动到新位置
    sw $zero, 4($v0)        # 擦除原水平位置
    j update_x

skip_horizontal_clean:
    sw $zero, 4($v0)        # 如果垂直旋转，清理水平像素

update_x:
    # 更新 capsule_x
    addi $t1, $t1, 1        # 增加 x 坐标
    sw $t1, capsule_x       # 保存新的 x 坐标到 capsule_x

    # 恢复 $v0 的值
    lw $v0, 0($sp)
    addi $sp, $sp, 4
    jr $ra                  # 返回调用点


move_down:
    # load capsule_x and capsule_y
    lw $t0, capsule_y        # load capsule_y
    lw $t2, capsule_rotation # load capsule_rotation

    # check the movemwnt limitation
    beq $t2, $zero, check_vertical_limit   # if rotate == check_vertical_limit
    li $t8, 29
    bge $t0, $t8, skip_move                # if y >= 45，skip_move
    j continue_move_down                   # if not at boundary, continue moving

check_vertical_limit:
    li $t8, 28
    bge $t0, $t8, skip_move                # if y >= 44，skip_move
    j continue_move_down                   # if not at boundary, continue moving

continue_move_down:
    addi $sp, $sp, -4
    sw $v0, 0($sp)
    
    # update prev_x, prev_y, prev_rotation
    lw $t1, capsule_x
    sw $t1, prev_x
    lw $t0, capsule_y
    sw $t0, prev_y
    lw $t2, capsule_rotation
    sw $t2, prev_rotation
    
    addi $sp, $sp, -4
    sw $a0, 0($sp)
    addi $sp, $sp, -4
    sw $a1, 0($sp)
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    add $a0, $zero, $t1
    add $a1, $zero, $t0
    jal coord_to_address    # get the address of capsule to $v0
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    lw $a1, 0($sp)
    addi $sp, $sp, 4
    lw $a0, 0($sp)
    addi $sp, $sp, 4
    
    
    lw $t3, 0($v0)   # load color of upper pixel into $t3
    lw $t4, 128($v0) # load color of lower pixel into $t4
    sw $t3, 128($v0) # color new upper pixel
    sw $t4, 256($v0) # color new lower pixel
    sw $zero, 0($v0) # erase original upper pixel

    # update capsule_y
    addi $t0, $t0, 1    # increment $t1 by 1 to increment capsule_y by 1
    sw $t0, capsule_y   # update the new incremented value to capsule_y
    
    # restore original $v0
    lw $v0, 0($sp)
    addi $sp, $sp, 4
    
    jr $ra  # return to previous position


# Function to convert coordinates (with the first pixel on bitmap as (0,0)) to address
# Inputs:
# - $a0 = x coordinate
# - $a1 = y coordinate
# Outputs:
# - $v0 = address
coord_to_address:
    # Store arguments into stack
    addi $sp, $sp, -4   # move stack pointer to the next empty position
    sw $a0, 0($sp)     # store $a0 into stack
    addi $sp, $sp, -4
    sw $a1, 0($sp)
    addi $sp, $sp, -4
    sw $t0, 0($sp)
    
    # TODO： change the comments
    # function body:
    lw $v0, ADDR_DSPL   # load the address of (0,0)

    # calculate the address of this pixel in respect to ADDR_BSTART
    li $t0, 128           # load 128 to $t0 for later multiplication
    mult $t0, $a1         # calculate the product of 128 and y coordinate $a1
    mflo $t0              # load the product result to $t0
    add $v0, $v0, $t0     # add this product to $v0
    li $t0, 4             # load 4 to $t0 for later multiplication
    mult $t0, $a0         # calculate the product of 4 and x coordinate $a0
    mflo $t0              # load the product result to $t0
    add $v0, $v0, $t0     # add this product to $v0

    # restore arguments from stack
    lw $t0, 0($sp)
    addi $sp, $sp, 4
    lw $a1, 0($sp)
    addi $sp, $sp, 4
    lw $a0, 0($sp)
    addi $sp, $sp, 4

    # return back to previous position
    jr $ra

# clean_down_rotate:
    # # erase the second one
    # sw $t4, 4($t3)
    # jr $ra
    

rotate_capsule:
    # update prev_x, prev_y, prev_rotation
    lw $t0, capsule_x
    sw $t0, prev_x
    lw $t1, capsule_y
    sw $t1, prev_y
    lw $t2, capsule_rotation
    sw $t2, prev_rotation

    # update capsule_rotation
    lw $t2, capsule_rotation
    xori $t7, $t2, 1
    sw $t7, capsule_rotation
    
    #clean
    lw $t5, bitmap_base
    lw $t6, display_width 

    # calculate past down location
    mul $t3, $t1, $t6
    add $t3, $t3, $t0
    sll $t3, $t3, 2
    add $t3, $t3, $t5

    li $t4, 0x00000000        # black
    sw $t4, 256($t3)
    bnez $t2, clean_rotate
    jr $ra   
    
clean_rotate:
    sw $t4, 4($t3)
    jr $ra 
    
##############################################################################
# Step 2: Draw the first two-halved capsule with random colors
##############################################################################
##############################################################################
# Function: draw_capsule
# Draws a vertical capsule at the neck of the bottle with random colors.
##############################################################################
##############################################################################
# Function: generate_random_color
# Generates a random color (red, blue, or yellow).
##############################################################################
init_colors:
    # capsule_color1
    jal get_random_color
    move $t0, $v0 # capsule color1= random color 
    sw $t0,capsule_color1
    
generate_color2:
    jal get_random_color
    move $t1, $v0               # capsule_color2 = random color
    sw $t1, capsule_color2
    j main_loop                 # Return to caller
    
get_random_color:
    addi $s3, $s3, 1        # Increment the random seed
    move $t7, $s3           # Copy seed value to $t7
    li $t8, 3               # Modulo value (3 colors)
    div $t7, $t8            # Divide $t7 by 3
    mfhi $t9                # Store the remainder in $t9

    # Choose color based on the remainder
    beq $t9, 0, select_red     # If remainder is 0, select red
    beq $t9, 1, select_green   # If remainder is 1, select green
    j select_blue              # If remainder is 2, select blue

select_red:
    li $v0, 0x00FF0000      # Load red color into $v0
    jr $ra                  # Return

select_green:
    li $v0, 0x0000FF00      # Load green color into $v0
    jr $ra                  # Return

select_blue:
    li $v0, 0x000000FF      # Load blue color into $v0
    jr $ra                  # Return

##############################################################################
# Function: draw_top_half
# Draws the top half of the capsule at row 2, column 31.
##############################################################################
draw_capsule:
    lw $t0, capsule_x
    lw $t1, capsule_y
    lw $t2, capsule_rotation
    lw $t5, bitmap_base
    lw $t6, display_width
    #li $t7, 0x00000000

    mul $t3, $t1, 32     
    add $t3, $t3, $t0      
    sll $t3, $t3, 2        
    add $t3, $t3, $t5 
    lw $t4, capsule_color1 
    #sw $t7, -256($t3)       #clean the previous capsule
    sw $t4, 0($t3)         

    beq $t2, 0, draw_vertical_capsule
    j draw_horizontal_capsule

draw_vertical_capsule:
    addi $t1, $t1, 1       
    mul $t3, $t1, 32
    add $t3, $t3, $t0
    sll $t3, $t3, 2
    add $t3, $t3, $t5
    lw $t4, capsule_color2  
    sw $t4, 0($t3)
    jr $ra

draw_horizontal_capsule:
    addi $t0, $t0, 1     
    mul $t3, $t1, 32
    add $t3, $t3, $t0
    sll $t3, $t3, 2
    add $t3, $t3, $t5
    lw $t4, capsule_color2
    sw $t4, 0($t3)
    jr $ra

##############################################################################
# Step 1: Draw the Left Boundary Column
##############################################################################
draw_left_boundary:
    lw $t0, ADDR_DSPL           # Load the base address of the display
    lw $t1, COLOR_GRAY          # Load the gray color
    li $t2, 4                   # Start row index (2nd row)
    mul $t2, $t2, 128           # Convert row index to byte offset
    add $t0, $t0, $t2           # Move to the start of the 2nd row
    li $t2, 2                  # Column index for the left boundary (20th unit)
    mul $t2, $t2, 4             # Convert to byte offset
    add $t0, $t0, $t2           # Move to the left boundary's position
    li $t2, 0                   # Row counter
    li $t3, 27                  # Total rows for the left boundary

draw_left_loop:
    sw $t1, 0($t0)              # Draw a pixel for the left boundary
    addiu $t0, $t0, 128         # Move to the next row
    addiu $t2, $t2, 1           # Increment row counter
    bne $t2, $t3, draw_left_loop # Loop until all rows are drawn
    jr $ra                      # Return to the main program

##############################################################################
# Step 2: Draw the First Half of the Top Row (Left Side)
##############################################################################
draw_top_row_left:
    lw $t0, ADDR_DSPL           # Load the base address of the display
    lw $t1, COLOR_GRAY          # Load the gray color
    li $t2, 4                   # Start row index (2nd row)
    mul $t2, $t2, 128           # Convert row index to byte offset
    add $t0, $t0, $t2           # Move to the start of the 2nd row
    li $t2, 3                  # Start column for the left half of the top row
    mul $t2, $t2, 4             # Convert to byte offset
    add $t0, $t0, $t2           # Move to the starting position
    li $t2, 0                   # Column counter
    li $t3, 8                   # Length of the left half (5 units)

draw_top_left_loop:
    sw $t1, 0($t0)              # Draw a pixel for the top row (left side)
    addiu $t0, $t0, 4           # Move to the next column
    addiu $t2, $t2, 1           # Increment column counter
    bne $t2, $t3, draw_top_left_loop # Loop until all columns are drawn
    jr $ra                      # Return to the main program

##############################################################################
# Step 3: Draw the Left Neck
##############################################################################
draw_left_neck:
    lw $t0, ADDR_DSPL           # Load the base address of the display
    lw $t1, COLOR_GRAY          # Load the gray color
    li $t2, 1                   # Start row index (2nd row)
    mul $t2, $t2, 128           # Convert row index to byte offset
    add $t0, $t0, $t2           # Move to the start of the 2nd row
    li $t2, 10                  # Start column for the left neck (30th unit)
    mul $t2, $t2, 4             # Convert to byte offset
    add $t0, $t0, $t2           # Move to the starting position of the left neck

    li $t2, 0                   # Row counter
    li $t3, 4                   # Total rows for the column
    
draw_left_neck_loop:
    sw $t1, 0($t0)              # Draw a pixel for the column
    addiu $t0, $t0, 128         # Move to the next row
    addiu $t2, $t2, 1           # Increment row counter
    bne $t2, $t3, draw_left_loop # Loop until all rows are drawn
    jr $ra                      # Return to the main program

##############################################################################
# Step 4: Draw the Right Neck
##############################################################################
draw_right_neck:
    lw $t0, ADDR_DSPL           # Load the base address of the display
    lw $t1, COLOR_GRAY          # Load the gray color
    li $t2, 1                   # Start row index (2nd row)
    mul $t2, $t2, 128           # Convert row index to byte offset
    add $t0, $t0, $t2           # Move to the start of the 2nd row
    li $t2, 16                  # Start column for the right neck (32nd unit)
    mul $t2, $t2, 4             # Convert to byte offset
    add $t0, $t0, $t2           # Move to the starting position of the right neck

    li $t2, 0                   # Row counter
    li $t3, 3                   # Total rows for the column
    
    li $t2, 0                   # Row counter
    li $t3, 4                   # Total rows for the column
    
draw_right_neck_loop:
    sw $t1, 0($t0)              # Draw a pixel for the column
    addiu $t0, $t0, 128         # Move to the next row
    addiu $t2, $t2, 1           # Increment row counter
    bne $t2, $t3, draw_left_loop # Loop until all rows are drawn
    jr $ra                      # Return to the main program

##############################################################################
# Step 5: Draw the Second Half of the Top Row (Right Side)
##############################################################################
draw_top_row_right:
    lw $t0, ADDR_DSPL           # Load the base address of the display
    lw $t1, COLOR_GRAY          # Load the gray color
    li $t2, 4                   # Start row index (2nd row)
    mul $t2, $t2, 128           # Convert row index to byte offset
    add $t0, $t0, $t2           # Move to the start of the 2nd row
    li $t2, 17                  # Start column for the right half of the top row
    mul $t2, $t2, 4             # Convert to byte offset
    add $t0, $t0, $t2           # Move to the starting position
    li $t2, 0                   # Column counter
    li $t3, 7                   # Length of the right half (5 units)

draw_top_right_loop:
    sw $t1, 0($t0)              # Draw a pixel for the top row (right side)
    addiu $t0, $t0, 4           # Move to the next column
    addiu $t2, $t2, 1           # Increment column counter
    bne $t2, $t3, draw_top_right_loop # Loop until all columns are drawn
    jr $ra                      # Return to the main program

##############################################################################
# Step 6: Draw the Right Boundary Column
##############################################################################
draw_right_boundary:
    lw $t0, ADDR_DSPL           # Load the base address of the display
    lw $t1, COLOR_GRAY          # Load the gray color
    li $t2, 4                   # Start row index (2nd row)
    mul $t2, $t2, 128           # Convert row index to byte offset
    add $t0, $t0, $t2           # Move to the start of the 2nd row
    li $t2, 24                  # Column index for the right boundary (42nd unit)
    mul $t2, $t2, 4             # Convert to byte offset
    add $t0, $t0, $t2           # Move to the right boundary's position
    li $t2, 0                   # Row counter
    li $t3, 27                  # Total rows for the right boundary

draw_right_loop:
    sw $t1, 0($t0)              # Draw a pixel for the right boundary
    addiu $t0, $t0, 128         # Move to the next row
    addiu $t2, $t2, 1           # Increment row counter
    bne $t2, $t3, draw_right_loop # Loop until all rows are drawn
    jr $ra                      # Return to the main program

##############################################################################
# Step 7: Draw the Bottom Row
##############################################################################
draw_bottom_row:
    lw $t0, ADDR_DSPL           # Load the base address of the display
    lw $t1, COLOR_GRAY          # Load the gray color
    li $t2, 30                   # Start row index (2nd row)
    mul $t2, $t2, 128           # Convert row index to byte offset
    add $t0, $t0, $t2           # Move to the start of the 2nd row
    li $t2, 2                  # Start column for the bottom row (20th unit)
    mul $t2, $t2, 4             # Convert to byte offset
    addiu $t0, $t0, 4           # Move to the bottom row (55 rows * 256 bytes)
    add $t0, $t0, $t2           # Move to the starting column
    li $t2, 0                   # Column counter
    li $t3, 21                  # Length of the bottom row (23 units)

draw_bottom_loop:
    sw $t1, 0($t0)              # Draw a pixel for the bottom row
    addiu $t0, $t0, 4           # Move to the next column
    addiu $t2, $t2, 1           # Increment column counter
    bne $t2, $t3, draw_bottom_loop # Loop until the bottom row is complete
    jr $ra                      # Return to the main program

