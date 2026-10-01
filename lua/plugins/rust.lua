-- lua/plugins/rust.lua
return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,

  config = function()
    vim.g.rustaceanvim = {
      server = {
        cmd = {
          os.getenv("RUST_ANALYZER_PATH") or "rust-analyzer",
        },

        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },

            checkOnSave = {
              enable = true,
              command = "clippy",
            },

            procMacro = {
              enable = true,
            },

            completion = {
              autoimport = {
                enable = true,
              },
              autoself = {
                enable = true,
              },
              callable = {
                snippets = "fill_arguments",
              },
              fullFunctionSignatures = {
                enable = true,
              },
            },

            diagnostics = {
              enable = true,
              experimental = {
                enable = true,
              },
            },

            files = {
              watcher = "client",
            },

            hover = {
              actions = {
                enable = true,
              },
              documentation = {
                enable = true,
              },
            },

            imports = {
              granularity = {
                group = "module",
              },
              prefix = "crate",
            },

            inlayHints = {
              bindingModeHints = {
                enable = false,
              },
              chainingHints = {
                enable = true,
              },
              closingBraceHints = {
                enable = true,
                minLines = 25,
              },
              closureCaptureHints = {
                enable = true,
              },
              closureReturnTypeHints = {
                enable = "with_block",
              },
              discriminantHints = {
                enable = "fieldless",
              },
              expressionAdjustmentHints = {
                enable = "always",
              },
              lifetimeElisionHints = {
                enable = "skip_trivial",
                useParameterNames = true,
              },
              parameterHints = {
                enable = true,
              },
              reborrowHints = {
                enable = "always",
              },
              renderColons = true,
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
            },

            lens = {
              enable = true,
              references = {
                adt = true,
                enumVariant = true,
                method = true,
                trait = true,
              },
            },

            semanticHighlighting = {
              operator = {
                enable = true,
              },
            },
          },
        },
      },

      tools = {
        enable_status_notifications = true,
      },
    }
  end,
}
