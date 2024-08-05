import numpy as np
from matplotlib import pyplot as plt


#Initial conditions
x=1.
v=0.
t=0.


#Delta t
dt = 1e-4

#Oscillator frequency
T = 3
w = 2*np.pi/T

def acceleration(x):
    return - (w**2)*x

def update(x,v,dt):
    return x+v*dt,v+dt*acceleration(x)

t_list = []
x_list = []
v_list = []

while t<10:
    t+=dt 
    x,v = update(x,v,dt)

    t_list.append(t)
    x_list.append(x)
    v_list.append(v)

plt.plot(t_list,x_list)
plt.ylabel('Position')
plt.xlabel('Time')
plt.title('Harmonic oscillator position for T={}'.format(T))
plt.savefig('harmonic_plots/plot_T={}.png'.format(T),dpi=500)



