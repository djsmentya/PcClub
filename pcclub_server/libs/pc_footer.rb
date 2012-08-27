# encoding: utf-8
require 'main_report_dialog'

class PcFooter < FXHorizontalFrame

    def initialize(parent)
        super(parent, :opts => LAYOUT_FILL_X)

        @tab_font = FXFont.new(app, "Arial,120,bold")
        on_init
    end

    def on_init

        init_tabbook

        init_statistic_panel(parent)

        init_clock
    end


    def init_clock
        c = Clock.new(self)
        c.font = FXFont.new(app, "Arial,480,bold")
        timeout = app.addTimeout(1000, :repeat => true) do
            t = Time.now
            c.text = t.strftime('%H:%M')
        end

    end

    def init_statistic_panel(parent)

        layout = FXVerticalFrame.new(self, :opts => LAYOUT_FILL_Y)
        btn_main_report = FXButton.new(layout, 'Главный отчет', :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_FILL)
        btn_all_reports = FXButton.new(layout, 'Вся статистика за сегодня', :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_FILL)
        btn_tools = FXButton.new(layout, 'Функции', :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_FILL)


        btn_main_report.connect(SEL_COMMAND) do |sender, sel, event|
            puts 'event'
            p = MainReportDialog.new(parent)
            p.create
            p.show
        end

    end

    def init_tabbook


        tabbook = FXTabBook.new(self)#TODO решить вид футера, :opts => LAYOUT_FILL_X)

        price_tab = FXTabItem.new(tabbook, "Цены" )
        @price_page = FXVerticalFrame.new(tabbook,
                                         :opts => FRAME_RAISED|LAYOUT_FILL)

        calculator_tab = FXTabItem.new(tabbook, "Калькулятор" )
        @calculator_page = FXVerticalFrame.new(tabbook,
                                         :opts => FRAME_RAISED|LAYOUT_FILL)

        fill_price_page
        fill_calculator_page

    end

    def fill_price_page
        price_stack = FXHorizontalFrame.new(@price_page, :opts => LAYOUT_FILL_X)
        text_price = FXTextField.new(price_stack, 10)
        label_price = FXLabel.new(price_stack, "Цена за час")
        label_price.font = @tab_font
        text_price = @tab_font
    end

    def fill_calculator_page

        calculator_stack = FXHorizontalFrame.new(@calculator_page, :opts => LAYOUT_FILL_X)
        text_price = FXTextField.new(calculator_stack, 10)
        label_price = FXLabel.new(calculator_stack, "грн. платим за")
        label_price.font = @tab_font
        text_price1 = FXTextField.new(calculator_stack, 10)
        label_price = FXLabel.new(calculator_stack, "час(ов)")
        label_price.font = @tab_font
        text_price = @tab_font


        calculator_stack = FXHorizontalFrame.new(@calculator_page, :opts => LAYOUT_FILL_X)
        text_price = FXTextField.new(calculator_stack, 10)
        label_price = FXLabel.new(calculator_stack, "% (процентов) скидки")
        label_price.font = @tab_font
    end

end
