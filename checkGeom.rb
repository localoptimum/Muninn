require 'matrix'

require_relative './sandmanLauncher.rb'

# Baseline gives flux of 8681.

# I started with a manual seed that looks sensible-ish
m1 = Vector[0.03, -0.4, 4.0, 0.03, 0.035, 4.0, 0.036, 0.04, 4.0]

o1 = Vector[0.011185829769636954, -0.4, 3.9221611997680776, 0.02, 0.027640501643536743, 1.791927426684372, 0.15, 0.15, 1.0]
o2 = Vector[0.011187932977300285, -0.4, 4.0, 0.02, 0.02764116857613464, 4.0, 0.13380136722424604, 0.14159106218869155, 2.942450388550024]

# This is shit and 1/4 of the flux of a bare monochromator.  I was going to give up but then...
# See how the first two m-values have maxed out at 4, and the focus has also capped at -4?  I relax to m=6 first piece and focus can go -1.0 m
o2p5 = Vector[0.0181968443954311, -0.6, 5.4085324838403155, 0.02678955617348458, 0.0304464630931984, 3.1428663973295636, 0.15, 0.15, 1.5378723889923598]

# Now we are getting somewhere: this is more than a factor of 2 in performance (22573):
o3 = Vector[0.03167938623133679, -0.7465851263161115, 6.0, 0.037485421183063916, 0.0391769970666346, 3.4440159273148265, 0.05178342186494714, 0.05268768057605808, 3.3266462213575068]

# Re-run for fun. Good but not quite as good (21158)
o4 = Vector[0.02904230483619866, -0.7541561227252913, 6.0, 0.03437089433098805, 0.0357188090963183, 5.0, 0.14832356572513297, 0.15, 1.0500193210617668]

testres = launchSandman(o3)

puts(testres)
