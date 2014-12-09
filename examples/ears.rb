5.times do
  ears left: Kernel.rand(0..10), right: Kernel.rand(0..10)
  Kernel.sleep(2)
end

ears_random
Kernel.sleep(2)
ears_reset
