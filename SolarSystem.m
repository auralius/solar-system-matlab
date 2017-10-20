classdef SolarSystem
    properties
        planets = {};
        num_of_planets = 0;
    end
    
    methods
        function obj = AddPlanet(obj, planet)
            obj.num_of_planets = obj.num_of_planets + 1;
            obj.planets = [obj.planets; planet];
        end
        
        function obj = Update(obj)
            G = 6.67428e-11;
            timestep = 24*3600;  % One day
            
            for i = 1 : obj.num_of_planets
                obj.planets(i).f = [0 0 0];
                for j = 1 : obj.num_of_planets
                    r =  norm(obj.planets(i).x - obj.planets(j).x);
                    if r > 0
                        f = G * obj.planets(i).mass * obj.planets(j).mass / r^2;
                        obj.planets(i).f = obj.planets(i).f - f*(obj.planets(i).x - obj.planets(j).x)/r;
                    end                 
                end
                
            obj.planets(i).a = obj.planets(i).f / obj.planets(i).mass;
            obj.planets(i).v = obj.planets(i).a * timestep + obj.planets(i).v;
            obj.planets(i).x = obj.planets(i).v * timestep + obj.planets(i).x;
    
            end
            
        end
        
    end
end
