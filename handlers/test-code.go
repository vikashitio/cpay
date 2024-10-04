package handlers

import (
	"fmt"
	"strconv"

	"github.com/go-resty/resty/v2"
	"github.com/gofiber/fiber/v2"
)

type CurrencyResponse map[string]map[string]float64

// Handler to get balance by address
func TestCode(c *fiber.Ctx) error {
	fmt.Println("Working")
	client := resty.New()
	toCrypto := "bitcoin"
	fromCurrency := "usd"
	amount := 5.00

	apiURL := "https://api.coingecko.com/api/v3/simple/price?ids=" + toCrypto + "&vs_currencies=" + fromCurrency

	fmt.Print(apiURL)

	var apiResponse CurrencyResponse
	_, err := client.R().SetResult(&apiResponse).Get(apiURL)
	if err != nil {
		return err
	}
	fmt.Println("apiResponse=>", apiResponse)
	fmt.Println("usdAmount=>", amount)
	rate := apiResponse[toCrypto][fromCurrency]
	fmt.Println("rate=>", rate)
	//fmt.Println("rate=>", rate)

	valueAmount := (amount / rate)

	strAmount := fmt.Sprintf("%.8f", valueAmount)

	fmt.Println("cryptoAmount=>", strAmount)

	cryptoAmount, err := strconv.ParseFloat(strAmount, 32)
	if err != nil {
		fmt.Println("Error converting string to float64", err)
	}
	fmt.Println("cryptoAmount=>", cryptoAmount)

	// Return balance as JSON
	return nil
}
