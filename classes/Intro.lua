function Intro()
    return {
        introDuration = 5.5,
        fadeDuration = 1.5,
        timer = 0,
        fadeInTimer = 0,
        fadeOutTimer = 0,
        showIntro = true,

        producerIntro = love.graphics.newImage("assets/logo.png"),
        introAlpha = 0,  -- Initial alpha value for fade-in

        update = function (self, dt)
            self.timer = self.timer + dt

                -- Fade-in effect
            if self.fadeInTimer < self.fadeDuration and self.introAlpha < 1 then
                self.fadeInTimer = self.fadeInTimer + dt
                self.introAlpha = math.min(1, self.fadeInTimer / self.fadeDuration)
            end

                -- Fade-out effect
            if self.timer >= self.introDuration - self.fadeDuration then
                self.fadeOutTimer = self.fadeOutTimer + dt
                self.introAlpha = math.max(0, 1 - self.fadeOutTimer / self.fadeDuration)
            end

            -- Check if the intro is finished
            if self.timer >= self.introDuration then
                state.intro, state.menu = false, true
                self.timer = 0
                self.introAlpha = 0
            end
        end,

        render = function (self)
            love.graphics.setColor(1, 1, 1, self.introAlpha)
            love.graphics.draw(self.producerIntro, 64, 112)
            love.graphics.setColor(1, 1, 1, 1)
        end
    }
end

return Intro