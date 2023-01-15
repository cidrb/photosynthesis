
t=0

function TIC()
   t=t+.2
   for i=0,4e4 do
      x=i%240
      y=i/240
      pix(x,y,(((x-20)^2+(y-20)^2)/1e3-t/2)%2)
   end
   
   for i=5,1,-1 do
      s= i%2-1
      R= 10+4*math.sin(t/2+i)
      m= 1/(3+i) 
      c = -20+45*i 
      d = 80+6*s*i

      line(c,136,c+20*math.sin(t/7+i),d,13)
      
      for T=0,240,.2 do
	 x=c+20*math.sin(t/7+i) +(R+m*R)*(math.cos(m*T) - math.cos(T+s*m*t))
	 y=d +(R+m*R)*(math.sin(m*T)+math.sin(T+s*m*t))
	 pix(x+1,y+1,9+i)
	 pix(x,y,8+i)

	 x=20+(R+m*R)*math.cos(m*T) - m*R*math.cos(T-t)
	 y=20+(R+m*R)*math.sin(m*T) + m*R*math.sin(T-t)
	 pix(x,y,11+i)
      end
      
      poke(65436+i,-R/11)
      
   end

end
