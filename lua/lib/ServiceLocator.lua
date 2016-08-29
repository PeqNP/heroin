--
-- Provides service location.
--
-- @copyright 2016 Upstart Illustration LLC. All rights reserved.
--

local ServiceLocator = Class()

function ServiceLocator.new(self)
    function self.init()
    end

    function self.registerContainer(container)
        -- Register dependencies associated to container.
    end

    function self.unregisterContainer(container)
        -- Unregister dependencies associated to container.
    end

    function self.getDependency(dependencyName)
        -- Get dependency, if it exists.
    end
end

local sInstance = ServiceLocator()

function ServiceLocator.registerContainer(container)
    sInstance.registerContainer(container)
end

function ServiceLocator.unregisterContainer(container)
    sInstance.unregisterContainer(container)
end

function ServiceLocator.getDependency(dependencyName)
    return sInstance.getDependency(dependencyName)
end

return ServiceLocator
