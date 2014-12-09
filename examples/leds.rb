colors = %w(FF0000 00FF00 0000FF FFFF00 00FFFF FF00FF)

colors.each do |color|
  leds color: color, pulse: 1, speed: Kernel.rand(300..1500)
  Kernel.sleep 2
end
