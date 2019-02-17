/*
 * Battlesnake Engine API
 *
 * This is the api of the Battlesnake game engine. See battlesnake.io for details.
 *
 * API version: 0.0.1
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package enginemodel

type StatusResponse struct {
	Game Game `json:"game,omitempty"`
	LastFrame GameFrame `json:"lastFrame,omitempty"`
}
