add wave -position insertpoint  sim:/keccak_tb/clk
add wave -position insertpoint  sim:/keccak_tb/rst_n
add wave -position insertpoint -color Orchid  -radix  hex sim:/keccak_tb/din
add wave -position insertpoint -color Orchid  -radix  hex sim:/keccak_tb/dout

add wave -divider INPUT_BUFFER
add wave -position insertpoint -color Orchid  -radix  hex sim:/keccak_tb/keccak_map/buffer_in/din_buffer_in
add wave -position insertpoint -color blue  -radix  hex sim:/keccak_tb/keccak_map/buffer_in/din_buffer_in


add wave -divider KECCAK_CORE
add wave -position insertpoint -color Orange insertpoint sim:/keccak_tb/keccak_map/*


run -all
