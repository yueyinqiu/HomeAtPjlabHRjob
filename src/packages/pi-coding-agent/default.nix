{ ... }: {
  programs.pi-coding-agent = {
    enable = true;

    settings = {
      defaultProvider = "tensoris";
      defaultModel = "deepseek-v4-pro-0813";
      defaultThinkingLevel = "low";

      retry = {
        maxRetries = 30;
      };
    };

    models = {
      providers = {
        "tensoris" = {
          baseUrl = "https://api.tensoris.ai/v1";
          api = "openai-completions";
          compat = {
            supportsDeveloperRole = false;
          };
          models = [
            {
              id = "deepseek-v4-pro-0813";
              name = "deepseek-v4-pro-0813";
              contextWindow = 900000;
              maxTokens = 384000;
              reasoning = true;
              input = [ "text" ];
            }
          ];
        };
      };
    };
  };
}
